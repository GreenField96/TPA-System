<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Filament\Panel;

class Member extends Model
{
    protected $fillable = [
        'company_id',
        'name',
        'member_ID',
        'family_ID',
        'is_active',
        'balance',
    ];

    protected function casts(): array
    {
        return [
            'is_active' => 'boolean',
            'balance' => 'decimal:2',
        ];
    }

    protected static function booted(): void
    {
        static::creating(function (Member $member) {
            // Automatically inherit annual_limit from company if balance isn't explicitly set
            if (empty($member->balance) && $member->company_id) {
                $company = Company::find($member->company_id);
                if ($company) {
                    $member->balance = $company->annual_limit;
                }
            }
        });
    }

    public function company(): BelongsTo
    {
        return $this->belongsTo(Company::class);
    }

    // Helper method to deduct medical service costs
    public function deductServiceCost(float $amount): bool
    {
        if ($this->balance < $amount) {
            return false; // Insufficient balance
        }

        $this->decrement('balance', $amount);
        return true;
    }


}