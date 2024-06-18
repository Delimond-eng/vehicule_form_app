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
        Schema::create('assurances', function (Blueprint $table) {
            $table->id();
            $table->string("numero_police");
            $table->string("nom_assureur");
            $table->timestamp("date_validite")->nullable();
            $table->unsignedBigInteger("type_assurance_id");
            $table->unsignedBigInteger("vehicule_id");
            $table->string("vehicule_npi");
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
        Schema::dropIfExists('assurances');
    }
};
