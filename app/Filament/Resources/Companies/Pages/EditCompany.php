<?php

namespace App\Filament\Resources\Companies\Pages;
// namespace App\Filament\Resources\CompanyResource\Pages;

use App\Filament\Resources\Companies\CompanyResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditCompany extends EditRecord
{
    protected static string $resource = CompanyResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
        ];
    }
}