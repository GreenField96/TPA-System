<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
   public function up(): void
    {
        Schema::create('members', function (Blueprint $table) {
            $table->id();
            $table->foreignId('company_id')->constrained('companies')->cascadeOnDelete();
            $table->string('name');
            $table->string('member_ID', 100)->unique();
            $table->string('family_ID', 100)->unique();
            $table->boolean('is_active')->default(true);
            // $table->decimal('used_limit', 12, 2)->default(0.00);
            $table->decimal('balance', 12, 2)->default(0.00);
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('members');
    }
};
