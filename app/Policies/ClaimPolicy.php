<?php

namespace App\Policies;

use App\Models\Claim;
use App\Models\User;
use Illuminate\Auth\Access\Response;

class ClaimPolicy
{
    
    // public function viewAny(User $user): bool
    // {
    //     return true;
    // }

    // public function view(User $user, Claim $claim): bool
    // {
    //     return true;
    // }

    // public function create(User $user): bool
    // {
    //     return $user->isProvider();
    // }
    // public function update(User $user, Claim $claim): bool
    // {
    //     return true;
    // }

    // public function delete(User $user, Claim $claim): bool
    // {
    //     return false;
    // }

    // public function restore(User $user, Claim $claim): bool
    // {
    //     return false;
    // }
    // public function forceDelete(User $user, Claim $claim): bool
    // {
    //     return false;
    // }



    // app/Policies/ClaimPolicy.php

public function viewAny(User $user): bool
{
    // ✅ Allow Doctors, Admins, and Providers to view claims list
    return $user->isAdmin() || $user->isDoctor() || $user->isProvider();
}

public function view(User $user, Claim $claim): bool
{
    // ✅ Doctors and Admins can view any claim
    if ($user->isAdmin() || $user->isDoctor()) {
        return true;
    }

    // Providers can only view their own claims
    return $user->isProvider() && $claim->provider_id === $user->id;
}

public function update(User $user, Claim $claim): bool
{
    // ✅ Allow Doctors and Admins to edit/review claims
    return $user->isAdmin() || $user->isDoctor();
}


}
