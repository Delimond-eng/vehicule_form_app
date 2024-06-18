<?php

namespace App\Http\Requests;
use Illuminate\Foundation\Http\FormRequest;

class StoreVehiculeRequest extends FormRequest
{
    public function authorize(): bool
    {
        return true;
    }

    public function rules(): array
    {
        return [
            'serie' => 'required|string|unique:vehicules,serie',
            'plaque' => 'required|string|unique:vehicules,plaque',
            'marque_id' => 'required|int|exists:marques,id',
            'chassis' => 'required|string',
            'modele' => 'required|string',
            'photo_avant' => 'required|file',
            'photo_arriere' => 'required|file',
            'profil_droit' => 'required|file',
            'profil_gauche' => 'required|file',
            'nbre_chevaux' => 'required|string',
            'date_debut_service' => 'required|date',
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
            'achat.achat_date' => 'required|date',
            'achat.nom_vendeur' => 'required|string',
            'achat.telephone_vendeur' => 'required|string',
            'achat.email_vendeur' => 'nullable|email',
            'achat.adresse_vendeur' => 'required|string',
        ];
    }
}