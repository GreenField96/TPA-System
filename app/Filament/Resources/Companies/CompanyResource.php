<?php

namespace App\Filament\Resources\Companies;

use App\Filament\Resources\Companies\Pages;
use App\Models\Company;
use Filament\Forms\Components\TextInput;
// use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Table;

use Filament\Schemas\Schema;
use Illuminate\Support\Facades\Auth;


class CompanyResource extends Resource
{
    protected static ?string $model = Company::class;

    protected static \BackedEnum|string|null $navigationIcon = 'heroicon-o-building-office';


    // protected static \UnitEnum|string|null $navigationGroup = 'Administration';
    protected static \UnitEnum|string|null $navigationGroup = 'Management';


    protected static ?int $navigationSort = 1;

    /**
     * Restrict access so only Admins can view or manage this resource.
     */
    public static function canAccess(): bool
    {
        return auth()->user()?->isAdmin() ?? false;
    }

    public static function form(Schema $schema): Schema
    {
        return $schema
            ->schema([
                TextInput::make('name')
                    ->label(__('Company Name'))
                    ->required()
                    ->maxLength(255),

                TextInput::make('email')
                    ->label(__('Email Address'))
                    ->email()
                    ->maxLength(255),

                TextInput::make('phone_number')
                    ->label(__('Phone Number'))
                    ->tel()
                    ->maxLength(50)
                    ->required(),

                TextInput::make('annual_limit')
                    ->label(__('Annual Limit'))
                    ->numeric()
                    ->prefix('LYD')
                    ->step('0.01')
                    ->required(),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('name')
                    ->label(__('Company Name'))
                    ->searchable()
                    ->sortable(),

                TextColumn::make('email')
                    ->label(__('Email'))
                    ->searchable()
                    ->placeholder('-'),

                TextColumn::make('phone_number')
                    ->label(__('Phone'))
                    ->placeholder('-'),

                TextColumn::make('annual_limit')
                    ->label(__('Annual Limit'))
                    ->money('LYD')
                    ->sortable(),

                TextColumn::make('members_count')
                    ->counts('members')
                    ->label(__('Total Members'))
                    ->sortable(),

                TextColumn::make('created_at')
                    ->label(__('Created'))
                    ->dateTime()
                    ->toggleable(isToggledHiddenByDefault: true),
            ])
            ->filters([
                //
            ]);
    }

    public static function getPages(): array
    {
        return [
            'index'  => Pages\ListCompanies::route('/'),
            'create' => Pages\CreateCompany::route('/create'),
            'edit'   => Pages\EditCompany::route('/{record}/edit'),
        ];
    }
}