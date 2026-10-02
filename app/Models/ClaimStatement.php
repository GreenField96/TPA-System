<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class ClaimStatement extends Model
{
    protected $fillable = [
        'provider_id',
        'statement_number',
        'total_claimed',
        'total_approved',
        'status',
    ];

    public function provider(): BelongsTo
    {
        return $this->belongsTo(User::class, 'provider_id');
    }

    public function claims(): HasMany
    {
        return $this->hasMany(Claim::class, 'statement_id');
    }
}