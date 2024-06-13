<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoreVehiculeRequest;
use App\Models\Achat;
use App\Models\Modele;
use App\Models\vehiculeType;
use App\Models\Proprietaire;
use App\Models\Vehicule;
use Illuminate\Http\Request;

class AppFormulaireController extends Controller
{
    public function store(StoreVehiculeRequest $request)
    {
        $validatedData = $request->validated();
        //create proprietaire
        $proprietaireData = $validatedData['proprietaire'];
        $proprietaire = Proprietaire::create($proprietaireData);

        if ($proprietaire) {
            // Save photos
            $photoAvant = $this->savePhoto($request, 'photo_avant');
            $photoArriere = $this->savePhoto($request, 'photo_arriere');
            $photoGauche = $this->savePhoto($request, 'profil_gauche');
            $photoDroit = $this->savePhoto($request, 'profil_droit');
            // Create vehicule
            $validatedData['photo_avant'] = $photoAvant;
            $validatedData['photo_arriere'] = $photoArriere;
            $validatedData['profil_droit'] = $photoDroit;
            $validatedData['profil_gauche'] = $photoGauche;
            $validatedData['proprietaire_id'] = $proprietaire->id;
            $validatedData ['code'] = Vehicule::generateUniqueCode();
            $vehicule = Vehicule::create($validatedData);
            // Create achat info
            if($vehicule){
                $achatData = $validatedData['achat'];
                $achatData['nip_acheteur'] = $proprietaire->nip_proprietaire;
                $achatData['vehicule_id'] = $vehicule->id;
                Achat::create($achatData);
                return back()->with([
                    'success' => 'Données enregistrées avec succès!',
                    'code'=>$vehicule->code
                ]);
            }
            return back()->with('error', 'l\'enregistrement n\'est pas terminé correctement');

        } else {
            return back()->with('error', 'Echec de l\'enregistrement des données!');
        }
    }



    public function gotoView()
    {
        $models = Modele::where('status', 'actif')->get();
        $vehiculeTypes = VehiculeType::where('status','actif')->get();
        return view('formulaire-vehicule', [
            'vehiculeTypes'=> $vehiculeTypes,
            'modeles'=> $models,
        ]);
    }

    private function savePhoto(Request $request, string $param) :string
    {
        if ($request->hasFile($param)) {
                $domain = $request->getHttpHost();
                $image = $request->file($param);
                $imageName = uniqid() . '.' . $image->getClientOriginalExtension();
                $image->move(public_path('uploads/vehicules'), $imageName);
                $path = 'http://' . $domain . '/uploads/vehicules/' . $imageName;
            return $path;
        }
        return "";
    }

}