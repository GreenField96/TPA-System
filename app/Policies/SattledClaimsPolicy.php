<?php

namespace App\Policies;

use App\Models\SattledClaims;
use App\Models\User;
use Illuminate\Auth\Access\Response;

class SattledClaimsPolicy
{
    /**
     * Determine whether the user can view any models.
     */
    public function viewAny(User $user): bool
    {
        return false;
    }

    /**
     * Determine whether the user can view the model.
     */
  public function view(User $user, Claim $claim): bool
{
    // ✅ Doctors and Admins can view any claim
    if ($user->isAdmin() || $user->isDoctor()) {
        return true;
    }

    // Providers can only view their own claims
    return $user->isProvider() && $claim->provider_id === $user->id;
}

    /**
     * Determine whether the user can create models.
     */
    public function create(User $user): bool
    {
        return false;
    }

    /**
     * Determine whether the user can update the model.
     */
    public function update(User $user, SattledClaims $sattledClaims): bool
    {
        return false;
    }

    /**
     * Determine whether the user can delete the model.
     */
    public function delete(User $user, SattledClaims $sattledClaims): bool
    {
        return false;
    }

    /**
     * Determine whether the user can restore the model.
     */
    public function restore(User $user, SattledClaims $sattledClaims): bool
    {
        return false;
    }

    /**
     * Determine whether the user can permanently delete the model.
     */
    public function forceDelete(User $user, SattledClaims $sattledClaims): bool
    {
        return false;
    }
}
