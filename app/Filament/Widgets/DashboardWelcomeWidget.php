<?php

namespace App\Filament\Widgets;

use Filament\Widgets\Widget;

class DashboardWelcomeWidget extends Widget
{
    // Fix: Removed 'static' keyword
    protected string $view = 'filament.widgets.dashboard-welcome-widget';

    // Full-width span across all grid columns
    protected int | string | array $columnSpan = 'full';
}