<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
         $brands = [
            "Abarth", "Acura", "Alfa Romeo", "Aston Martin", "Audi",
            "Bentley", "BMW", "Bugatti", "Buick", "Cadillac",
            "Chevrolet", "Chrysler", "Citroën", "Dacia", "Daewoo",
            "Daihatsu", "Dodge", "Ferrari", "Fiat", "Ford",
            "Genesis", "GMC", "Honda", "Hyundai", "Infiniti",
            "Isuzu", "Jaguar", "Jeep", "Kia", "Koenigsegg",
            "Lamborghini", "Lancia", "Land Rover", "Lexus", "Lincoln",
            "Lotus", "Maserati", "Mazda", "McLaren", "Mercedes-Benz",
            "Mini", "Mitsubishi", "Nissan", "Pagani", "Peugeot",
            "Porsche", "Ram", "Renault", "Rolls-Royce", "Saab",
            "Subaru", "Suzuki", "Tesla", "Toyota", "Volkswagen",
            "Volvo", "Alpina", "Apollo", "Arrinera", "Ascari",
            "Baojun", "Bollinger", "Borgward", "Brilliance", "BYD",
            "Caterham", "Changan", "Chery", "De Tomaso", "DMC",
            "DS Automobiles", "Faraday Future", "Fisker", "Geely", "Ginetta",
            "Great Wall", "Haval", "Hennessey", "Hispano Suiza", "Hongqi",
            "Hummer", "JAC", "Karma", "Lucid", "Mahindra",
            "Marussia", "MG", "Nio", "Opel", "Perodua",
            "Proton", "Qoros", "Rimac", "Rivian", "Roewe",
            "SEAT", "SRT", "SSC North America", "Tata", "Troller",
            "Vauxhall", "Venucia", "VinFast", "Wiesmann", "Wuling",
            "XPeng", "Zotye"
        ];
        $assureTypes = [
            "Assurance automobile",
            "Assurance moto",
            "Assurance camion",
            "Assurance véhicule de loisirs",
            "Assurance flotte automobile",
            "Assurance taxi ou VTC",
            "Assurance transport de marchandises",
            "Assurance engins agricoles ou de chantier",
            "Assurance véhicules de collection",
            "Assurance véhicules électriques ou hybrides"
        ];
        $types_de_vehicules = [
            'SUV',
            'Berline',
            'Camion',
            'Coupé',
            'Cabriolet',
            'Break',
            'Monospace',
            'Pick-up',
            'Van'
        ];
        foreach ($brands as $brand) {
            \App\Models\Marque::updateOrCreate([
                "marque_libelle"=> $brand
            ], [
                "marque_libelle"=> $brand
            ]);
        }

        foreach($assureTypes as $assure){
            \App\Models\TypeAssurance::updateOrCreate(
                ["type_assurance_libelle"=>$assure],
                ["type_assurance_libelle"=>$assure],
             );
        }

        foreach ($types_de_vehicules as $type) {
            \App\Models\VehiculeType::updateOrCreate(
                [
                    'vehicule_type_libelle'=> $type
                ],
                [
                    'vehicule_type_libelle'=> $type
                ]
            );
        }
        // \App\Models\User::factory(10)->create();

        // \App\Models\User::factory()->create([
        //     'name' => 'Test User',
        //     'email' => 'test@example.com',
        // ]);
    }
}