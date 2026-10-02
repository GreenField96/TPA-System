<?php

namespace App\Models;

use App\Enums\UserRole;
use Filament\Models\Contracts\FilamentUser;
use Filament\Panel;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

class User extends Authenticatable implements FilamentUser
{
    use HasFactory, Notifiable;

    protected $fillable = [
        'name',
        'email',
        'password',
        'role',
    ];

    protected $hidden = [
        'password',
        'remember_token',
    ];

    protected function casts(): array
    {
        return [
            'password' => 'hashed',
            'role' => UserRole::class,
        ];
    }

    /*
    |--------------------------------------------------------------------------
    | Role Helper Methods
    |--------------------------------------------------------------------------
    */

    public function isAdmin(): bool
    {
        return $this->role === UserRole::ADMIN;
    }

    public function isDoctor(): bool
    {
        return $this->role === UserRole::DOCTOR;
    }

    public function isProvider(): bool
    {
        return $this->role === UserRole::PROVIDER;
    }

    /**
     * Authorize access to Filament panels
     */
    public function canAccessPanel(Panel $panel): bool
    {
         // Allow active admins, doctors, and providers to log into the admin panel
        return in_array($this->role, ['admin', 'doctor', 'provider'])
            || in_array($this->role, [
                \App\Enums\UserRole::ADMIN,
                \App\Enums\UserRole::DOCTOR,
                \App\Enums\UserRole::PROVIDER,
            ]);
    }

      
}