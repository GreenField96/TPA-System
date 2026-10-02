<?php

namespace App\Filament\Resources\Members;

use App\Filament\Resources\Members\Pages;
use App\Models\Member;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Table;
use Filament\Actions\DeleteAction;
use Filament\Actions\EditAction;
use App\Filament\Resources\Members\Schemas\MemberForm;
use Filament\Schemas\Schema;

use Filament\Tables\Filters\SelectFilter;
use Filament\Tables\Filters\TernaryFilter;


class MemberResource extends Resource
{
    protected static ?string $model = Member::class;

// Use BackedEnum|string|null to match Filament\Resources\Resource
    protected static \BackedEnum|string|null $navigationIcon = 'heroicon-o-users';

    // Use UnitEnum|string|null to match Filament\Resources\Resource
    protected static \UnitEnum|string|null $navigationGroup = 'Management';


    public static function form(Schema $schema): Schema
    {
        return MemberForm::configure($schema);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('member_ID')
                    ->label(__('Member ID'))
                    ->searchable()
                    ->sortable(),

                TextColumn::make('name')
                    ->label(__('Full Name'))
                    ->searchable()
                    ->sortable(),

                TextColumn::make('company.name')
                    ->label(__('Company'))
                    ->searchable()
                    ->sortable(),

                TextColumn::make('family_ID')
                    ->label(__('Family ID'))
                    ->searchable(),

                TextColumn::make('balance')
                    ->label(__('Balance'))
                    ->money('LYD')
                    ->sortable(),

                TextColumn::make('is_active')
                    ->label(__('Status'))
                    ->badge()
                    ->formatStateUsing(fn (bool $state): string => $state ? __('Active') : __('Blocked'))
                    ->color(fn (bool $state): string => $state ? 'success' : 'danger'),
            ])
            ->filters([
                SelectFilter::make('company_id')
                    ->label(__('Company'))
                    ->relationship('company', 'name'),

                TernaryFilter::make('is_active')
                    ->label(__('Active Status')),
            ])
            ->actions([
                EditAction::make(),
                DeleteAction::make(),
            ]);
            // ->bulkActions([
            //     Tables\Actions\BulkActionGroup::make([
            //         Tables\Actions\DeleteBulkAction::make(),
            //     ]),
            // ]);
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListMembers::route('/'),
            'create' => Pages\CreateMember::route('/create'),
            'edit' => Pages\EditMember::route('/{record}/edit'),
        ];
    }
}