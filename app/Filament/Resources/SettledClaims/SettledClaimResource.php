<?php

namespace App\Filament\Resources\SettledClaims;

use App\Filament\Resources\SettledClaims\Pages;
use App\Models\Claim;
use Filament\Resources\Resource;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Filament\Tables\Filters\SelectFilter;
use Filament\Tables\Columns\Summarizers\Sum;

class SettledClaimResource extends Resource
{
    protected static ?string $model = Claim::class;

    protected static ?string $navigationLabel = 'Settled Claims';

    protected static \BackedEnum|string|null $navigationIcon = 'heroicon-o-check-badge';

    protected static \UnitEnum|string|null $navigationGroup = 'Claims Management';

    public static function getEloquentQuery(): Builder
    {
        $query = parent::getEloquentQuery()->whereIn('status', ['appr', 'part', 'rej']);

        if (auth()->user()?->isProvider()) {
            return $query->where('provider_id', auth()->id());
        }
        if (auth()->user()?->isDoctor()) {
        return $query->where('reviewer_id', auth()->id()); // Filter claims reviewed by this doctor
        }
        return $query;
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('statement.statement_number')
                    ->label(__('Statement #'))
                    ->searchable(),

                TextColumn::make('member.member_ID')
                    ->label(__('Member ID'))
                    ->searchable(),

                TextColumn::make('claimed_amount')
                    ->label(__('Claimed'))
                    ->money('LYD'),

                TextColumn::make('approved_amount')
                    ->label(__('Approved'))
                    ->money('LYD')
                    ->summarize(
                        Sum::make()
                            ->label(__('Total Approved'))
                            ->money('LYD')
                    ),

                TextColumn::make('status')
                    ->sortable()
                    ->label(__('Final Status'))
                    ->badge()
                    ->formatStateUsing(fn (string $state): string => match ($state) {
                        'appr' => 'Approved',
                        'part' => 'Partially Approved',
                        'rej'  => 'Rejected',
                        default => $state,
                    })
                    ->color(fn (string $state): string => match ($state) {
                        'appr' => 'success',
                        'part' => 'info',
                        'rej'  => 'danger',
                        default => 'gray',
                    }),

                TextColumn::make('provider.name')
                ->label(__('provider'))
                ->sortable(),

                TextColumn::make('reviewer.name')
                    ->label(__('Reviewed By')),

                TextColumn::make('reviewer_notes')
                    ->label(__('Notes'))
                    ->limit(30)
            ])->filters([
                SelectFilter::make('provider_id')
                ->label(__('Provider'))
                ->relationship('provider', 'name', modifyQueryUsing: fn (Builder $query) => $query->where('role', 'prv')) 
                ->searchable()
                ->preload()
                ->visible(fn () => auth()->user()?->isAdmin() || auth()->user()?->isDoctor())
                ]);
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListSettledClaims::route('/'),
        ];
    }
}