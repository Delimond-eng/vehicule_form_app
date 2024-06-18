<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('achats', function (Blueprint $table) {
            $table->id();
            $table->string('achat_prix');
            $table->string('devise')->default('CDF');
            $table->timestamp('achat_date')->nullable();
            $table->string('nip_acheteur');
            $table->string('nom_vendeur');
            $table->string('telephone_vendeur');
            $table->string('email_vendeur')->nullable();
            $table->string('adresse_vendeur');
            $table->unsignedBigInteger('vehicule_id');
            $table->string('vehicule_npi');
            $table->string('status')->default('actif');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('achats');
    }
};