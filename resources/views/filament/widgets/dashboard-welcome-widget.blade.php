<x-filament-widgets::widget>
    <x-filament::section>
        <div class="flex items-center justify-between">
            <div>
                <h2 class="text-xl font-bold tracking-tight text-gray-950 dark:text-white">
                    {{ __('Welcome back,') }} {{ auth()->user()->name }}! 👋
                </h2>
                <p class="mt-1 text-sm text-gray-500 dark:text-gray-400">
                    @if (auth()->user()?->isProvider())
                        {{ __('Here is a summary of all claims submitted by your facility.') }}
                    @elseif (auth()->user()?->isDoctor())
                        {{ __('Overview of submitted claims awaiting review and medical verification.') }}
                    @else
                        {{ __('System-wide overview of all medical claims and review statistics.') }}
                    @endif
                </p>
            </div>

            <div class="hidden sm:block">
                <span class="inline-flex items-center gap-x-1.5 rounded-md bg-primary-50 px-3 py-1.5 text-xs font-medium text-primary-700 ring-1 ring-inset ring-primary-600/20 dark:bg-primary-400/10 dark:text-primary-400 dark:ring-primary-400/30">
                    {{ ucfirst(auth()->user()->role?->value ?? 'User') }}
                </span>
            </div>
        </div>
    </x-filament::section>
</x-filament-widgets::widget>