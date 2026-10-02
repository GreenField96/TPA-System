<?php

namespace App\Enums;

use Filament\Support\Contracts\HasColor;
use Filament\Support\Contracts\HasLabel;

enum UserRole: string implements HasLabel, HasColor
{
    case ADMIN = 'adm';
    case DOCTOR = 'doc';
    case PROVIDER = 'prv';

    public function getLabel(): ?string
    {
        return match ($this) {
            self::ADMIN => 'System Admin',
            self::DOCTOR => 'Medical Auditor (Doctor)',
            self::PROVIDER => 'Healthcare Provider',
        };
    }

    public function getColor(): string|array|null
    {
        return match ($this) {
            self::ADMIN => 'danger',
            self::DOCTOR => 'info',
            self::PROVIDER => 'success',
        };
    }
}