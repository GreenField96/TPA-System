<?php

namespace App\Filament\Resources\Claims\Pages;

use App\Filament\Resources\Claims\ClaimResource;
use Filament\Resources\Pages\CreateRecord;

class CreateClaim extends CreateRecord
{
    protected static string $resource = ClaimResource::class;
    protected function mutateFormDataBeforeCreate(array $data): array
    {
        // $user = auth()->user();

        // $data['provider_id'] = $user->provider_id ?? $user->id;
        // $data['status'] = 'pending';
        // return $data;
        $user = auth()->user();

        if ($user && $user->isProvider()) {
            $data['provider_id'] = $user->id;
            $data['status'] = 'pending';
        }

        return $data;
    }
}
