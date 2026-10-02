<?php

namespace App\Filament\Resources\Claims;

use App\Filament\Resources\Claims\Schemas\ClaimForm;
use App\Filament\Resources\Claims\Pages;
use App\Models\Claim;
use App\Models\ClaimStatement;
use Filament\Actions\BulkAction;
use Filament\Actions\EditAction;
use Filament\Notifications\Notification;
use Filament\Resources\Resource;
use Filament\Schemas\Schema;
use Filament\Tables;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Collection;
// use Filament\Tables\Actions\EditAction;

use Filament\Tables\Filters\SelectFilter;

use Illuminate\Support\Facades\DB;

class ClaimResource extends Resource
{
    protected static ?string $model = Claim::class;

    protected static \BackedEnum|string|null $navigationIcon = 'heroicon-o-document-text';

    protected static \UnitEnum|string|null $navigationGroup = 'Claims Management';
    
   
    
    public static function form(Schema $schema): Schema
    {
        return ClaimForm::configure($schema);
    }

    public static function getEloquentQuery(): Builder
    {
    $query = parent::getEloquentQuery();
    $user = auth()->user();

    if ($user->isDoctor()) {
        return $query->whereIn('status', ['processing']);
    }

    // If user is a Provider, show only their own claims
    if ($user->isProvider()) {
        return $query->where('provider_id', $user->id)
                     ->where('status', 'pending');
    }
    if ($user->isAdmin()) {
        return $query->whereIn('status', ['processing']);
    }
}

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('member.member_ID')
                    ->label(__('Member ID'))
                    ->searchable()
                    ->sortable(),

                TextColumn::make('member.name')
                    ->label(__('Member Name'))
                    ->searchable(),

                TextColumn::make('service_date')
                    ->label(__('Service Date'))
                    ->date()
                    ->sortable(),

                TextColumn::make('claimed_amount')
                    ->label(__('Claimed Amount'))
                    ->money('LYD')
                    ->sortable(),
                
                    TextColumn::make('provider.name')
                    ->label(__('provider'))
                    ->sortable(),

                TextColumn::make('status')
                    ->label(__('Status'))
                    ->badge()
                    ->color(fn (string $state): string => match ($state) {
                        'pending'    => 'warning',
                        'processing' => 'info',
                        'settled'    => 'success',
                        'rejected'   => 'danger',
                        default      => 'gray', 
                }),
            ])
            ->filters([
                SelectFilter::make('provider_id')
                ->label(__('Provider'))
                ->relationship('provider', 'name', modifyQueryUsing: fn (Builder $query) => $query->where('role', 'prv')) 
                ->searchable()
                ->preload()
                ->visible(fn () => auth()->user()?->isAdmin() || auth()->user()?->isDoctor())
            
            ])
            
            ->bulkActions([
    BulkAction::make('generateStatementFromSelected')
        ->label(__('Generate Statement'))
        ->action(function (Collection $records) {
            $providerId = auth()->id();
            $claimIds = $records->pluck('id');
            $totalClaimed = $records->sum('claimed_amount');

            DB::transaction(function () use ($providerId, $claimIds, $totalClaimed) {
                $statement = ClaimStatement::create([
                    'provider_id'      => $providerId,
                    'statement_number' => 'STMT-' . strtoupper(uniqid()),
                    'total_claimed'    => $totalClaimed,
                    'status'           => 'processing',
                ]);

                Claim::whereIn('id', $claimIds)->update([
                    'statement_id' => $statement->id,
                    'status'       => 'processing',
                ]);
            });
        })
        ->visible(fn () => auth()->user()?->isProvider()),
        ]);
    }

    public static function getPages(): array
    {
        return [
            'index'  => Pages\ListClaims::route('/'),
            'create' => Pages\CreateClaim::route('/create'),
            'edit'   => Pages\EditClaim::route('/{record}/edit'),
        ];
    }
}