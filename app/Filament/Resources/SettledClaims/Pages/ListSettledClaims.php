<?php

namespace App\Filament\Resources\SettledClaims\Pages;

use App\Filament\Resources\SettledClaims\SettledClaimResource;
use Filament\Actions\CreateAction;
use Filament\Resources\Pages\ListRecords;

class ListSettledClaims extends ListRecords
{
    protected static string $resource = SettledClaimResource::class;

   protected function getHeaderActions(): array
    {
        return [
            // Leave this array empty or omit CreateAction
        ];
    }
}
