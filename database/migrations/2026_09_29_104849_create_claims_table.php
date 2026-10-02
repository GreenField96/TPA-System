<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('claims', function (Blueprint $table) {
            $table->id();
            $table->foreignId('member_id')->constrained('members')->cascadeOnDelete();
            $table->foreignId('provider_id')->constrained('users')->cascadeOnDelete();
            $table->foreignId('reviewer_id')->nullable()->constrained('users')->nullOnDelete();
            $table->foreignId('statement_id')->nullable()->constrained('claim_statements')->nullOnDelete();
            $table->date('service_date');
            $table->decimal('claimed_amount', 12, 2);
            $table->decimal('approved_amount', 12, 2)->nullable();
            // $table->enum('status', ['pend', 'appr', 'part', 'rej'])->default('pend');
            $table->string('status', 20)->default('pending');
            $table->string('reviewer_notes')->nullable();
            $table->timestamp('locked_at')->nullable();
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('claims');
    }
};
