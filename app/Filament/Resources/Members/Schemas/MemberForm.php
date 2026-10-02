<?php

namespace App\Filament\Resources\Members\Schemas;

use App\Models\Company;
use Filament\Schemas\Components\Section;

use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\Toggle;
use Filament\Schemas\Components\Utilities\Get;
use Filament\Schemas\Components\Utilities\Set;
use Filament\Schemas\Schema;

class MemberForm
{
    public static function configure(Schema $schema): Schema
    {
        return $schema
            ->components([
                Section::make(__('Member Information'))
                    ->schema([
                        Select::make('company_id')
                            ->label(__('Company'))
                            ->relationship('company', 'name')
                            ->searchable()
                            ->preload()
                            ->required()
                            ->live()
                            ->afterStateUpdated(function (Get $get, Set $set, $state) {
                                if ($state && empty($get('balance'))) {
                                    $annualLimit = Company::where('id', $state)->value('annual_limit');
                                    $set('balance', $annualLimit ?? 0.00);
                                }
                            }),

                        TextInput::make('name')
                            ->label(__('Full Name'))
                            ->required()
                            ->maxLength(255),

                        TextInput::make('member_ID')
                            ->label(__('Member ID'))
                            ->required()
                            ->unique(ignoreRecord: true)
                            ->maxLength(100),

                        TextInput::make('family_ID')
                            ->label(__('Family ID'))
                            ->required()
                            ->maxLength(100),

                        TextInput::make('balance')
                            ->label(__('Remaining Balance'))
                            ->numeric()
                            ->prefix('LYD')
                            ->helperText(__('Inherits company annual limit on company selection.'))
                            ->dehydrated()
                            ->disabled(),

                        Toggle::make('is_active')
                            ->label(__('Active Status'))
                            ->default(true)
                            ->onColor('success')
                            ->offColor('danger'),
                    ])->columns(2),
            ]);
    }
}
