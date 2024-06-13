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
        Schema::create('vehicules', function (Blueprint $table) {
            $table->id();
            $table->string('code');
            $table->string('serie');
            $table->string('plaque');
            $table->string('couleur');
            $table->string('chassis');
            $table->string('marque');
            $table->string('photo_avant');
            $table->string('photo_arriere');
            $table->string('profil_droit');
            $table->string('profil_gauche');
            $table->string('nbre_chevaux');
            $table->string('date_debut_service');
            $table->string('validite_assurance')->nullable();
            $table->string('police_assurance')->nullable();
            $table->string('type_usage');
            $table->unsignedBigInteger('vehicule_type_id');
            $table->unsignedBigInteger('modele_id');
            $table->unsignedBigInteger('proprietaire_id');
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
        Schema::dropIfExists('motos');
    }
};