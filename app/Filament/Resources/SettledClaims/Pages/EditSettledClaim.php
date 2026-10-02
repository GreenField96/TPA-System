<?php

namespace App\Filament\Resources\SettledClaims\Pages;

use App\Filament\Resources\SettledClaims\SettledClaimResource;
use Filament\Actions\DeleteAction;
use Filament\Resources\Pages\EditRecord;

class EditSettledClaim extends EditRecord
{
    protected static string $resource = SettledClaimResource::class;

    protected function getHeaderActions(): array
    {
        return [
            DeleteAction::make(),
        ];
    }
}
