<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('companies', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->string('email')->unique();
            $table->string('phone_number');
            $table->decimal('annual_limit', 12, 2)->default(0.00);
            // $table->string('policy_number', 100)->unique();
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('companies');
    }
};
