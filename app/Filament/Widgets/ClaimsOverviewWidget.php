<?php

namespace App\Filament\Widgets;

use App\Models\Claim;
use Filament\Widgets\StatsOverviewWidget as BaseWidget;
use Filament\Widgets\StatsOverviewWidget\Stat;

class ClaimsOverviewWidget extends BaseWidget
{
    protected function getStats(): array
    {
        $user = auth()->user();

        // Base query: filter by provider if logged-in user is a provider
        $query = Claim::query();

        if ($user?->isProvider()) {
            $query->where('provider_id', $user->id); 
            // Note: Update 'provider_id' if your foreign key column has a different name
        }
        if ($user?->isDoctor()) {
            $query->where('reviewer_id', $user->id); 
            // Note: Update 'provider_id' if your foreign key column has a different name
        }
        // Calculate counts
        $totalSent = (clone $query)->count();
        $approved  = (clone $query)->where('status', 'appr')->count();
        $partially = (clone $query)->where('status', 'part')->count();
        $rejected  = (clone $query)->where('status', 'rej')->count();

        return [
            Stat::make(__('Total Sent Claims'), $totalSent)
                ->icon('heroicon-o-paper-airplane')
                ->color('info'),

            Stat::make(__('Approved Claims'), $approved)
                ->icon('heroicon-o-check-circle')
                ->color('success'),

            Stat::make(__('Partially Approved Claims'), $partially)
                ->icon('heroicon-o-exclamation-triangle')
                ->color('warning'),

            Stat::make(__('Rejected Claims'), $rejected)
                ->icon('heroicon-o-x-circle')
                ->color('danger'),
        ];
    }
}