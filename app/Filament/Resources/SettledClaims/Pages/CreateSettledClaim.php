<?php

namespace App\Filament\Resources\SettledClaims\Pages;

use App\Filament\Resources\SettledClaims\SettledClaimResource;
use Filament\Resources\Pages\CreateRecord;

class CreateSettledClaim extends CreateRecord
{
    protected static string $resource = SettledClaimResource::class;
    protected function getHeaderActions(): array
    {
        return [
            // Leave this array empty or omit CreateAction
        ];
    }
}
