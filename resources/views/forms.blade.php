@extends('layouts.ui')
@section('content')
    <div class="container">
        <!-- Start::row-1 -->
        <div class="row">
            <div class="col-xl-12">
                <div class="card custom-card">
                    <div class="card-body p-0 product-checkout">
                        <ul class="nav nav-tabs tab-style-2 d-sm-flex d-block border-bottom border-block-end-dashed" id="myTab1" role="tablist">
                            <li class="nav-item" role="presentation">
                                <button class="nav-link active" id="vehicule-tab" data-bs-toggle="tab"
                                    data-bs-target="#vehicule-tab-pane" type="button" role="tab"
                                    aria-controls="vehicule-tab" aria-selected="true"><i
                                        class="ri-car-fill me-2 align-middle"></i>Infos du vehicule</button>
                            </li>
                            <li class="nav-item" role="presentation">
                                <button class="nav-link" id="assure-tab" data-bs-toggle="tab"
                                    data-bs-target="#assure-tab-pane" type="button" role="tab"
                                    aria-controls="assure-tab" aria-selected="true"><i
                                        class="ri-car-washing-fill me-2 align-middle"></i>Assurances</button>
                            </li>
                            <li class="nav-item" role="presentation">
                                <button class="nav-link" id="photo-tab" data-bs-toggle="tab"
                                    data-bs-target="#photo-tab-pane" type="button" role="tab"
                                    aria-controls="photo-tab" aria-selected="false"><i
                                        class="ri-camera-3-fill me-2 align-middle"></i>Capture photos</button>
                            </li>
                            <li class="nav-item" role="presentation">
                                <button class="nav-link" id="achat-tab" data-bs-toggle="tab"
                                    data-bs-target="#achat-tab-pane" type="button" role="tab"
                                    aria-controls="achat-tab" aria-selected="false"><i
                                        class="ri-money-dollar-circle-fill me-2 align-middle"></i>Infos sur l'achat</button>
                            </li>
                        </ul>
                        <form class="tab-content" id="myForm" method="post" action="{{ route('vehicule.store') }}" enctype="multipart/form-data">
                            @csrf
                            <div class="tab-pane fade show active border-0 p-0" id="vehicule-tab-pane" role="tabpanel"
                                aria-labelledby="vehicule-tab-pane" tabindex="0">
                                <div class="p-4">
                                    <p class="mb-1 fw-semibold text-muted op-5 fs-20">01</p>
                                    <div class="fs-15 fw-semibold d-sm-flex d-block align-items-center justify-content-between mb-3">
                                        <div>Informations du vehicule </div>
                                    </div>
                                    <div class="row gy-4 mb-4">
                                        <div class="col-md-4">
                                            <div class="form-floating">
                                                <select class="form-control" id="typevehicule_id" name="vehicule_type_id" required>
                                                    <option value="" hidden>Sélectionner le type de véhicule</option>
                                                    <!-- Options dynamiques -->
                                                    @foreach ($vehiculeTypes as $type)
                                                        <option value="{{ $type->id }}">{{ $type->vehicule_type_libelle }}</option>
                                                    @endforeach
                                                </select>
                                                <label for="typevehicule_id">Type véhicule *</label>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-floating">
                                                <select class="form-control" id="marque_id" name="marque_id" required>
                                                    <option value="" selected hidden>Sélectionnez une marque...</option>
                                                    <!-- Options dynamiques -->
                                                    @foreach ($marques as $marque)
                                                        <option value="{{ $marque->id }}">{{ $marque->marque_libelle }}</option>
                                                    @endforeach
                                                </select>
                                                <label for="marque_id">Marque *</label>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-floating">
                                                <input type="text" class="form-control" id="modele" name="modele" placeholder="Entrez le modèle..." required>
                                                <label for="modele">Modèle *</label>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-floating">
                                                <input type="text" class="form-control" id="plaque" name="plaque" placeholder="Entrez n° plaque... ex: KN-6951-BG" required>
                                                <label for="plaque">Numéro Plaque *</label>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-floating">
                                                <input type="text" class="form-control" id="serie" name="serie" placeholder="Entrez la série de la véhicule..." required>
                                                <label for="serie">Série *</label>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-floating">
                                                <input type="number" class="form-control" id="nbre_chevaux" name="nbre_chevaux" placeholder="ex: 2" required>
                                                <label for="nbre_chevaux">Nombre de chevaux *</label>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-floating">
                                                <input type="text" id="nipProprietaire" class="form-control" name="proprietaire[nip_proprietaire]" placeholder="Entrez le NIP du propriétaire" required>
                                                <label for="nipProprietaire">NIP propriétaire (KN-P-0000-AAA)*</label>
                                            </div>
                                        </div>
                                        <div class="col-md-4 d-none" id="nipInfoProprietaire">
                                            <div class="form-floating">
                                                <input type="text" id="npiProprietaireInfoInput" readonly class="form-control form-control-primary" placeholder="Nom de la personne associée au NIP">
                                                <label for="npiProprietaireInfoInput">Identité du propriétaire associé au NPI</label>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-floating">
                                                <input type="text" class="form-control" id="chassis" name="chassis" placeholder="Entrez le numéro de chassis..." required>
                                                <label for="chassis">Numéro chassis *</label>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-floating">
                                                <input type="date" class="form-control" id="date_debut_service" name="date_debut_service" required>
                                                <label for="date_debut_service">Date de mise en service *</label>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-floating">
                                                <select class="form-control" id="type_usage" name="type_usage" required>
                                                    <option value="" selected hidden>Sélectionnez un type d'usage</option>
                                                    <option value="Personnel">Personnel</option>
                                                    <option value="Transport en commun">Transport en commun</option>
                                                </select>
                                                <label for="type_usage">Usage *</label>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-floating">
                                                <input type="color" class="form-control form-control" id="couleur" name="couleur" value="#136ad0" required>
                                                <label for="couleur">Couleur *</label>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-floating">
                                                <input type="text" class="form-control  delimiters" id="npiChauffeur" name="proprietaire[nip_chauffeur]" required>
                                                <label for="npiChauffeur">NIP du chauffeur (KN-P-0000-AAA)*</label>
                                            </div>
                                        </div>
                                        <div class="col-md-4 d-none" id="npiChauffeurInfo">
                                            <div class="form-floating">
                                                <input type="text" readonly class="form-control form-control-primary" id="npiChauffeurInfoInput" required>
                                                <label for="npiChauffeurInfoInput">Identité du chauffeur associé au NIP</label>
                                            </div>
                                        </div>

                                    </div>
                                </div>

                                <div class="px-4 py-3 border-top border-block-start-dashed d-sm-flex justify-content-end">
                                    <button type="button" class="btn btn-primary" id="vehicule-next-trigger">Suvant<i class="ri-arrow-right-line ms-2 align-middle d-inline-block"></i></button>
                                </div>
                            </div>
                            <div class="tab-pane fade border-0 p-0" id="assure-tab-pane" role="tabpanel"
                                aria-labelledby="assure-tab-pane" tabindex="0">
                                <div class="p-4">
                                    <p class="mb-1 fw-semibold text-muted op-5 fs-20">02</p>
                                    <div class="fs-15 fw-semibold d-sm-flex d-block align-items-center justify-content-between mb-3">
                                        <div>Assurances(optionnelle)</div>
                                    </div>
                                    <div class="row gy-2 assure-content">

                                    </div>
                                </div>
                                <div class="px-4 py-3 border-top border-block-start-dashed d-sm-flex justify-content-between">
                                    <button type="button" class="btn btn-primary-light m-1" id="back-assure-trigger"><i class="ri-arrow-left-line me-2 align-middle d-inline-block"></i>Précédent</button>
                                    <button type="button" class="btn btn-primary m-1" id="assure-next-trigger">Suivant<i class="ri-arrow-right-line align-middle ms-2 d-inline-block"></i></button>
                                </div>
                            </div>

                            <div class="tab-pane fade border-0 p-0" id="photo-tab-pane"
                                role="tabpanel" aria-labelledby="photo-tab-pane" tabindex="0">
                                <div class="p-4">
                                    <div class="p-5 checkout-payment-success my-3">
                                        <p class="mb-1 fw-semibold text-muted op-5 fs-20">03</p>
                                        <div class="mb-5">
                                            <h5 class="text-primary fw-semibold">Capturez les photos</h5>
                                        </div>
                                        <div class="mb-5">
                                            <div class="row d-flexn justify-content-center align-items-center">
                                                <div class="col-md-3">
                                                    <div  class="photo-picker" id="photo-picker1" style="position: relative;">
                                                        <small>Profil vehicule avant</small>
                                                        <video id="video-preview1" style="border-radius: 5px; position: relative; cursor: pointer;" height="150" class="d-none img-fluid" autoplay></video>
                                                        <img id="photo-preview1" style="border-radius: 5px; position: relative; width: 100%; cursor: pointer;" height="150" class="img-fluid" src="{{ asset('assets2/images/placeholder2.jpg') }}">

                                                        <button type="button" id="capture-btn1" class="btn btn-outline-primary btn-sm w-100 mt-2">
                                                            <i class="ri-camera-3-line me-1"></i>Lancer caméra
                                                        </button>
                                                        <label for="photo1" class="btn btn-outline-dark btn-sm w-100 mt-1">
                                                            <i class="ri-attachment-2 me-1"></i>Charger photo
                                                        </label>
                                                        <input type="file" id="photo1" name="photo_avant" style="visibility: hidden">
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="photo-picker" id="photo-picker2" style="position: relative;">
                                                        <small>Profil vehicule arrière</small>
                                                        <video id="video-preview2" style="border-radius: 5px; position: relative; cursor: pointer;" height="150" class="d-none img-fluid" autoplay></video>
                                                        <img id="photo-preview2" style="border-radius: 5px; position: relative; width: 100%; cursor: pointer;" height="150" class="img-fluid" src="{{ asset('assets2/images/placeholder2.jpg') }}">

                                                        <button type="button" id="capture-btn2" class="btn btn-outline-primary btn-sm w-100 mt-2">
                                                            <i class="ri-camera-3-line"></i>Lancer caméra
                                                        </button>
                                                        <label for="photo2" class="btn btn-outline-dark btn-sm w-100 mt-1">
                                                            <i class="ri-attachment-2 me-1"></i>Charger photo
                                                        </label>
                                                        <input type="file" id="photo2" name="photo_arriere" style="visibility: hidden">
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="photo-picker" id="photo-picker3" style="position: relative;">
                                                        <small>Profil vehicule droit</small>
                                                        <video id="video-preview3" style="border-radius: 5px; position: relative; cursor: pointer;" height="150" class="d-none img-fluid" autoplay></video>
                                                        <img id="photo-preview3" style="border-radius: 5px; position: relative; width: 100%; cursor: pointer;" height="150" class="img-fluid" src="{{ asset('assets2/images/placeholder2.jpg') }}">

                                                        <button type="button" id="capture-btn3" class="btn btn-outline-primary btn-sm w-100 mt-2">
                                                            <i class="ri-camera-3-line me-1"></i>Lancer caméra
                                                        </button>
                                                        <label for="photo3" class="btn btn-outline-dark btn-sm w-100 mt-1">
                                                            <i class="ri-attachment-2 me-1"></i>Charger photo
                                                        </label>
                                                        <input type="file" id="photo3" name="profil_droit" style="visibility: hidden">
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="photo-picker" id="photo-picker4" style="position: relative;">
                                                        <small>Profil vehicule droit</small>
                                                        <video id="video-preview4" style="border-radius: 5px; position: relative; cursor: pointer;" height="150" class="d-none img-fluid" autoplay></video>
                                                        <img id="photo-preview4" style="border-radius: 5px; position: relative; width: 100%; cursor: pointer;" height="150" class="img-fluid" src="{{ asset('assets2/images/placeholder2.jpg') }}">

                                                        <button type="button" id="capture-btn4" class="btn btn-outline-primary btn-sm w-100 mt-2">
                                                            <i class="ri-camera-3-line me-1"></i>Lancer caméra
                                                        </button>
                                                        <label for="photo4" class="btn btn-outline-dark btn-sm w-100 mt-1">
                                                            <i class="ri-attachment-2 me-1"></i>Charger photo
                                                        </label>
                                                        <input type="file" id="photo4" name="profil_gauche" style="visibility: hidden">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="px-4 py-3 border-top border-block-start-dashed d-sm-flex justify-content-between">
                                    <button type="button" class="btn btn-primary-light m-1" id="back-photo-trigger"><i class="ri-arrow-left-line me-2 align-middle d-inline-block"></i>Précédeent</button>
                                    <button type="button" class="btn btn-primary m-1" id="photo-next-trigger">Suivant<i class="ri-arrow-right-line align-middle ms-2 d-inline-block"></i></button>
                                </div>
                            </div>

                            <div class="tab-pane fade border-0 p-0" id="achat-tab-pane" role="tabpanel"
                                aria-labelledby="achat-tab-pane" tabindex="0">
                                <div class="p-4">
                                    <p class="mb-1 fw-semibold text-muted op-5 fs-20">04</p>
                                    <div class="fs-15 fw-semibold d-sm-flex d-block align-items-center justify-content-between mb-3">
                                        <div>Informations de l'achat du vehicule</div>
                                    </div>

                                    <div class="row gy-4 mb-4">
                                        <div class="col-xl-6">
                                            <div class="row gx-2">
                                                <div class="col-md-10 col-10">
                                                    <div class="form-floating">
                                                        <input type="number" class="form-control" placeholder="entrez le prix d'achat de la véhicule..." id="prixAchat" name="achat[achat_prix]">
                                                        <label for="prixAchat">Prix achat *</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-2 col-2">
                                                    <div class="form-floating">
                                                        <select name="achat[devise]" id="devise" class="form-control">
                                                            <option value="CDF" selected>CDF</option>
                                                            <option value="USD">USD</option>
                                                            <option value="EURO">EURO</option>
                                                        </select>
                                                        <label for="devise">Devise</label>
                                                    </div>
                                                </div>

                                            </div>

                                        </div>
                                        <div class="col-xl-6">
                                            <div class="form-floating">
                                                <input type="date" class="form-control" placeholder="entrez la date d'achat..." id="dateAchat" name="achat[achat_date]">
                                                <label for="dateAchat">Date d'achat *</label>
                                            </div>
                                        </div>
                                        <div class="col-xl-6">
                                            <div class="form-floating">
                                                <input type="text" class="form-control" placeholder="entrez le nom du vendeur..." name="achat[nom_vendeur]">
                                                <label for="nom_vendeur">Société ou personne vendeuse</label>
                                            </div>
                                        </div>
                                        <div class="col-xl-6">
                                            <div class="form-floating">
                                                <input type="text" class="form-control" placeholder="entrez le téléphone du vendeur..." name="achat[telephone_vendeur]">
                                                <label for="telephone_vendeur">Téléphone du vendeur *</label>
                                            </div>
                                        </div>
                                        <div class="col-xl-6">
                                            <div class="form-floating">
                                                <input type="text" class="form-control" placeholder="entrez l'adresse email du vendeur..." name="achat[email_vendeur]">
                                                <label for="email_vendeur">Email du vendeur (optionnel)</label>
                                            </div>
                                        </div>
                                        <div class="col-xl-6">
                                            <div class="form-floating">
                                                <textarea class="form-control" placeholder="entrez l'adresse du vendeur... ex. n°..avenue..quartier..." name="achat[adresse_vendeur]"></textarea>
                                                <label for="adresse_vendeur">Adresse du vendeur *</label>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                                <div class="px-4 py-3 border-top border-block-start-dashed d-sm-flex justify-content-between">
                                    <button type="button" class="btn btn-primary-light m-1" id="back-achat-trigger"><i class="ri-arrow-left-line me-2 align-middle d-inline-block"></i>Précédent</button>
                                    <button type="submit" id="submitBtn" class="btn btn-success">
                                        <span id="loading" class="spinner-border spinner-border-sm d-none"></span>
                                        <span id="btnText">Sauvarder</span>
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!--End::row-1 -->
    </div>
@endsection

@section('styles')
    <link rel="stylesheet" href="{{ asset('assets2/libs/sweetalert2/sweetalert2.min.css') }}">
@endsection
@section('scripts')
    <script>
        var typeAssurances = @json($typeAssurances);
    </script>
    <script src="{{ asset('assets2/libs/sweetalert2/sweetalert2.min.js') }}"></script>
    <script src="{{ asset('assets2/js/app.js') }}"></script>
    <script src="{{ asset('assets2/js/tab_manager.js') }}"></script>
    <script src="{{asset('assets2/js/form_manager.js') }}"></script>
@endsection
