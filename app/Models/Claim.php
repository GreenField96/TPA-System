<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;
class Claim extends Model
{
   protected $fillable = [
        'member_id',
        'provider_id',
        'reviewer_id',
        'statement_id',
        'service_date',
        'claimed_amount',
        'approved_amount',
        'status',
        'reviewer_notes',
        'locked_at',
    ];

    public function attachments(): HasMany
    {
        return $this->hasMany(ClaimAttachment::class, 'claim_id');
    }

    protected function casts(): array
    {
        return [
            'service_date' => 'date',
            'claimed_amount' => 'decimal:2',
            'approved_amount' => 'decimal:2',
            'locked_at' => 'datetime',
        ];
    }

    public function member(): BelongsTo
    {
        return $this->belongsTo(Member::class);
    }

    public function provider(): BelongsTo
    {
        return $this->belongsTo(User::class, 'provider_id');
    }

    public function reviewer(): BelongsTo
    {
        return $this->belongsTo(User::class, 'reviewer_id');
    }

    public function statement(): BelongsTo
    {
        return $this->belongsTo(ClaimStatement::class, 'statement_id');
    }
}