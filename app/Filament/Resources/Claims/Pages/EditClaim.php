<?php

namespace App\Filament\Resources\Claims\Pages;

use App\Filament\Resources\Claims\ClaimResource;
use Filament\Actions\DeleteAction;
use Filament\Resources\Pages\EditRecord;

class EditClaim extends EditRecord
{
    protected static string $resource = ClaimResource::class;

   protected function getHeaderActions(): array
    {
        // Hide delete button on top of page for Doctors
        if (auth()->user()?->isDoctor()) {
            return [];
        }

        return [
            \Filament\Actions\DeleteAction::make(),
        ];
    }

    protected function mutateFormDataBeforeSave(array $data): array
    {
        $user = auth()->user();

        if ($user?->isAdmin() || $user?->isDoctor()) {
            $data['reviewer_id'] = $user->id;
            $data['locked_at'] = now();

            if (
                isset($data['status'], $data['approved_amount']) &&
                in_array($data['status'], ['appr', 'part']) &&
                !empty($data['approved_amount'])
            ) {
                $this->record->member?->deductServiceCost((float) $data['approved_amount']);
            }
        }

        return $data;
    }
    protected function getRedirectUrl(): string
    {
        return static::getResource()::getUrl('index');
    }
}
