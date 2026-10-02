<?php

namespace App\Filament\Resources\Claims\Pages;

use App\Filament\Resources\Claims\ClaimResource;
use Filament\Actions\CreateAction;
use Filament\Resources\Pages\ListRecords;
use App\Models\Claim;
use App\Models\ClaimStatement;
use Filament\Actions\Action;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Support\Facades\DB;

use Filament\Actions;

class ListClaims extends ListRecords
{
    protected static string $resource = ClaimResource::class;


    protected function getHeaderActions(): array
    {
       return [
            Actions\CreateAction::make()
                ->label('New Claim')
                ->visible(fn (): bool => auth()->user()?->isProvider() ?? false),
        ];
    }
}
