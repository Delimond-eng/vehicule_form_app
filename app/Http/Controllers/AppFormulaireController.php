<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoreVehiculeRequest;
use App\Models\Achat;
use App\Models\Assurance;
use App\Models\Marque;
use App\Models\Modele;
use App\Models\Proprietaire;
use App\Models\TypeAssurance;
use App\Models\Vehicule;
use App\Models\VehiculeType;
use App\Services\NPIService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class AppFormulaireController extends Controller
{
    protected NPIService $nPIService;

    public function __construct(NPIService $nPIService){
        $this->nPIService = $nPIService;
    }
    public function store(Request $request)
    {
        // Validation des données
        $validator = Validator::make($request->all(), [
            'serie' => 'required|string',
            'plaque' => 'required|string|unique:vehicules,plaque',
            'marque_id' => 'required|int|exists:marques,id',
            'chassis' => 'required|string',
            'modele' => 'required|string',
            'photo_avant' => 'required|file',
            'photo_arriere' => 'required|file',
            'profil_droit' => 'required|file',
            'profil_gauche' => 'required|file',
            'nbre_chevaux' => 'required|string',
            'date_debut_service' => 'required|date|before_or_equal:now',
            'assurances'=> 'nullable|array',
            'assurances.*.numero_police'=> 'required|string',
            'assurances.*.nom_assureur'=> 'required|string',
            'assurances.*.date_validite'=> 'required|date',
            'assurances.*.type_assurance_id'=> 'required|int|exists:type_assurances,id',
            'type_usage' => 'required|string',
            'couleur' => 'required|string',
            'vehicule_type_id' => 'required|int|exists:vehicule_types,id',
            'proprietaire.nip_proprietaire' => 'required|string',
            'proprietaire.nip_chauffeur' => 'required|string',
            'achat.achat_prix' => 'required|string',
            'achat.devise' => 'required|string',
            'achat.achat_date' => 'required|date|before_or_equal:now',
            'achat.nom_vendeur' => 'required|string',
            'achat.telephone_vendeur' => 'required|string',
            'achat.email_vendeur' => 'nullable|email',
            'achat.adresse_vendeur' => 'required|string',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'errors' => $validator->errors()->all(),
            ]);
        }
        $validatedData = $validator->validate();
        //Verifie le NPI proprietaire
        $isNPIvalid = $this->nPIService->checkNpi($validatedData['proprietaire']['nip_proprietaire']);
        if (!$isNPIvalid) {
            return response()->json([
                "error"=>"NPI proprietaire invalide !"
            ]);
        }
        //Verifie le NPI du chauffeur
        $isChauffeurNPIInvalid = $this->nPIService->checkNpi($validatedData['proprietaire']['nip_chauffeur']);
        if (!$isChauffeurNPIInvalid) {
            return response()->json([
                "error"=>"NPI du chauffeur invalide !"
            ]);
        }
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
            $validatedData ['code'] = Vehicule::generateUniqueCode($validatedData["type_usage"]);

            $vehicule = Vehicule::create($validatedData);
            // Create achat info
            if($vehicule){
                $achatData = $validatedData['achat'];
                $achatData['nip_acheteur'] = $proprietaire->nip_proprietaire;
                $achatData['vehicule_id'] = $vehicule->id;
                $achatData['vehicule_npi'] = $vehicule->code;
                Achat::create($achatData);
                $assurances = $validatedData['assurances'];
                foreach ($assurances as $assure) {
                    $assure["vehicule_id"] = $vehicule->id;
                    $assure["vehicule_npi"] = $vehicule->code;
                    Assurance::create($assure);
                }
                return response()->json([
                    'success' => 'Données enregistrées avec succès!',
                    'code'=>$vehicule->code,
                    'type_use'=>$vehicule->type_usage,
                ]);
            }
            return response()->json([
                'error' =>  'l\'enregistrement n\'est pas terminé correctement',
            ]);


        } else {
             return response()->json([
                'error' =>  'l\'enregistrement n\'est pas terminé correctement',
            ]);
        }
    }



    public function gotoView()
    {
        $brands = Marque::all();
        $vehiculeTypes = VehiculeType::where('status','actif')->get();
        $assuranceTypes = TypeAssurance::all();
        return view('formulaire-vehicule', [
            'vehiculeTypes'=> $vehiculeTypes,
            'typeAssurances'=> $assuranceTypes,
            'marques'=> $brands,
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