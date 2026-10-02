<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Company extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'email',
        'phone_number',
        'annual_limit',
    ];

    protected function casts(): array
    {
        return [
            'annual_limit' => 'decimal:2',
        ];
    }

    /**
     * Get all members belonging to this company.
     */
    public function members(): HasMany
    {
        return $this->hasMany(Member::class);
    }

    /**
     * Get all users linked to this company.
     */
    public function users(): HasMany
    {
        return $this->hasMany(User::class);
    }
}