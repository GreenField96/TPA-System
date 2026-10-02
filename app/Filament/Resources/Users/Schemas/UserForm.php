<?php

namespace App\Filament\Resources\Users\Schemas;

use Filament\Schemas\Components\Section;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use Filament\Schemas\Schema;
use Illuminate\Support\Facades\Hash;
use App\Enums\UserRole;

class UserForm
{
    public static function configure(Schema $schema): Schema
    {
        return $schema
            ->components([
                Section::make(__('User Details'))
                    ->schema([
                        TextInput::make('name')
                            ->label(__('Full Name'))
                            ->required()
                            ->maxLength(255),

                        TextInput::make('email')
                            ->label(__('Email Address'))
                            ->email()
                            ->required()
                            ->unique(ignoreRecord: true)
                            ->maxLength(255),

                        TextInput::make('phone_num')
                            ->label(__('Phone Number'))
                            ->tel()
                            ->nullable(),

                        TextInput::make('password')
                            ->label(__('Password'))
                            ->password()
                            ->dehydrateStateUsing(fn ($state) => Hash::make($state))
                            ->dehydrated(fn ($state) => filled($state))
                            ->required(fn (string $context): bool => $context === 'create'),

                       Select::make('role')
    ->label(__('Account Type / Role'))
    ->options([
        UserRole::ADMIN->value => 'Administrator',
        UserRole::DOCTOR->value => 'Doctor',
        UserRole::PROVIDER->value => 'Provider',
    ])
    ->required()
    ->live()
    ->default(UserRole::PROVIDER->value),


                        
                    ])->columns(2),
            ]);
    }
}