<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('claim_statements', function (Blueprint $table) {
            $table->id();
            $table->foreignId('provider_id')->constrained('users')->cascadeOnDelete();
            $table->string('statement_number', 100)->unique();
            $table->decimal('total_claimed', 14, 2)->default(0.00);
            $table->string('status', 20)->default('pending');
            // $table->enum('status', ['draft', 'submitted', 'processing', 'settled', 'paid'])->default('submitted');
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('claim_statements');
    }
};
