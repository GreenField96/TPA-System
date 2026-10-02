<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('claim_attachments', function (Blueprint $table) {
            $table->id();
            $table->foreignId('claim_id')->constrained('claims')->cascadeOnDelete();
            $table->string('file_path', 500);
            $table->enum('file_type', ['pdf', 'jpg', 'png']);
            $table->unsignedBigInteger('file_size');
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('claim_attachments');
    }
};
