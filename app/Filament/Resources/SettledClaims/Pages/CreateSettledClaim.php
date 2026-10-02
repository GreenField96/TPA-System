<?php

namespace App\Filament\Resources\SettledClaims\Pages;

use App\Filament\Resources\SettledClaims\SettledClaimResource;
use Filament\Resources\Pages\CreateRecord;

class CreateSettledClaim extends CreateRecord
{
    protected static string $resource = SettledClaimResource::class;
    
}
