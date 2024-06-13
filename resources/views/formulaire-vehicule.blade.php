@extends('layouts.app')

@section('content')
    <div id="form_container">
        <div class="row no-gutters">
            <div class="col-lg-12">
                <div id="wizard_container">
                    <!-- /top-wizard -->
                    <form id="wrapped" method="post" action="{{ route('vehicule.store') }}" enctype="multipart/form-data">
                        @csrf
                        @if (session('success'))
                            <div class="alert alert-success alert-dismissible fade show" role="alert">
                                {{ session('success') }}, le numéro d'identification est : <strong>{{ session('code') }}</strong>
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                        @endif

                        @if ($errors->any())
                            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                <ul>
                                    @foreach ($errors->all() as $error)
                                        <li>{{ $error }}</li>
                                    @endforeach
                                </ul>
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                        @endif
                        @if(session('error'))
                            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                {{ session('error') }}
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                        @endif
                        <div id="middle-wizard">
                            <div class="container-fluid">
                                <h3 class="main_question ml-2"><i class="arrow_right"></i>Veuillez renseigner les champs requis !</h3>
                                <div class="row">
                                    <div class="col-md-3" >
                                        <div  class="photo-picker" id="photo-picker1" style="position: relative;">
                                            <small>Profil vehicule avant</small>
                                            <video id="video-preview1" style="border-radius: 5px; position: relative; cursor: pointer;" height="150" class="d-none img-fluid" autoplay></video>
                                            <img id="photo-preview1" style="border-radius: 5px; position: relative; width: 100%; cursor: pointer;" height="150" class="img-fluid" src="{{ asset('assets/img/camera-placeholder.jpg') }}">

                                            <button type="button" id="capture-btn1" class="btn btn-outline-primary btn-sm w-100 mt-2">
                                                <i class="icon-camera-1 mr-1"></i>Lancer caméra
                                            </button>
                                            <label for="photo1" class="btn btn-outline-dark btn-sm w-100 mt-1">
                                                <i class="icon-attach-4 mr-1"></i>Charger photo
                                            </label>
                                            <input type="file" id="photo1" name="photo_avant" style="visibility: hidden">
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="photo-picker" id="photo-picker2" style="position: relative;">
                                            <small>Profil vehicule arrière</small>
                                            <video id="video-preview2" style="border-radius: 5px; position: relative; cursor: pointer;" height="150" class="d-none img-fluid" autoplay></video>
                                            <img id="photo-preview2" style="border-radius: 5px; position: relative; width: 100%; cursor: pointer;" height="150" class="img-fluid" src="{{ asset('assets/img/camera-placeholder.jpg') }}">

                                            <button type="button" id="capture-btn2" class="btn btn-outline-primary btn-sm w-100 mt-2">
                                                <i class="icon-camera-1 mr-1"></i>Lancer caméra
                                            </button>
                                            <label for="photo2" class="btn btn-outline-dark btn-sm w-100 mt-1">
                                                <i class="icon-attach-4 mr-1"></i>Charger photo
                                            </label>
                                            <input type="file" id="photo2" name="photo_arriere" style="visibility: hidden">
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="photo-picker" id="photo-picker3" style="position: relative;">
                                            <small>Profil vehicule gauche</small>
                                            <video id="video-preview3" style="border-radius: 5px; position: relative; cursor: pointer;" height="150" class="d-none img-fluid" autoplay></video>
                                            <img id="photo-preview3" style="border-radius: 5px; position: relative; width: 100%; cursor: pointer;" height="150" class="img-fluid" src="{{ asset('assets/img/camera-placeholder.jpg') }}">

                                            <button type="button" id="capture-btn3" class="btn btn-outline-primary btn-sm w-100 mt-2">
                                                <i class="icon-camera-1 mr-1"></i>Lancer caméra
                                            </button>
                                            <label for="photo3" class="btn btn-outline-dark btn-sm w-100 mt-1">
                                                <i class="icon-attach-4 mr-1"></i>Charger photo
                                            </label>
                                            <input type="file" id="photo3" name="profil_gauche" style="visibility: hidden">
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="photo-picker" id="photo-picker4" style="position: relative;">
                                            <small>Profil vehicule droit</small>
                                            <video id="video-preview4" style="border-radius: 5px; position: relative; cursor: pointer;" height="150" class="d-none img-fluid" autoplay></video>
                                            <img id="photo-preview4" style="border-radius: 5px; position: relative; width: 100%; cursor: pointer;" height="150" class="img-fluid" src="{{ asset('assets/img/camera-placeholder.jpg') }}">

                                            <button type="button" id="capture-btn4" class="btn btn-outline-primary btn-sm w-100 mt-2">
                                                <i class="icon-camera-1 mr-1"></i>Lancer caméra
                                            </button>
                                            <label for="photo4" class="btn btn-outline-dark btn-sm w-100 mt-1">
                                                <i class="icon-attach-4 mr-1"></i>Charger photo
                                            </label>
                                            <input type="file" id="photo4" name="profil_droit" style="visibility: hidden">
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="typevehicule">Type vehicule *</label>
                                            <select class="form-control" id="typevehicule_id" name="vehicule_type_id" required>
                                                <option value="" hidden>Sélectionner le type de vehicule</option>
                                                @foreach ($vehiculeTypes as $type)
                                                    <option value="{{ $type->id }}">{{ $type->vehicule_type_libelle }}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                                <label for="Modele">Modele *</label>
                                                <select class="form-control" id="modele_id" name="modele_id" required>
                                                    <option value="" hidden>Sélectionner le modele de la vehicule</option>
                                                    @foreach ($modeles as $modele)
                                                        <option value="{{ $modele->id }}">{{ $modele->modele_libelle }}</option>
                                                    @endforeach
                                                </select>
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="marque">Marque *</label>
                                            <input type="text" class="form-control" placeholder="entrez la marque de la vehicule" id="marque" name="marque" >
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="numplaque">Numéro Plaque *</label>
                                            <input type="text" class="form-control" id="plaque" name="plaque" placeholder="entrez le numero de la plaque..." required>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="numserie">Numéro série *</label>
                                            <input type="text" class="form-control" id="numserie" name="serie" placeholder="entrez la serie de la vehicule..." required>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="nip">NIP proprietaire *</label>
                                            <input type="text" class="form-control" name="proprietaire[nip_proprietaire]" placeholder="entrez le nip du proprietaire" id="nip" name="nip" >
                                         </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="numchassis">Numéro chassis *</label>
                                            <input type="text" class="form-control" id="chassis" name="chassis" placeholder="entrez le numero de chassis..." required>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="dateMisEnService">Date de mise en service*</label>
                                            <input type="date" class="form-control" id="date_naissance" name="date_debut_service" required>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="typeUsageVehicule">Type Usage *</label>
                                            <select class="form-control" id="typeUsageVehicule" name="type_usage" required>
                                                <option >Personnel</option>
                                                <option >Taxi</option>
                                                <!-- Options dynamiques -->
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-2">
                                        <div class="form-group">
                                            <label for="couleur">Couleur</label>
                                            <input type="color" class="form-control" placeholder="entrez la couleur" id="couleur" name="couleur" >
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="nipchauffeur">Nip chauffeur*</label>
                                            <input type="text" class="form-control" id="nipchauffeur" name="proprietaire[nip_chauffeur]" placeholder="Entrez le nip du chauffeur" required>
                                        </div>
                                    </div>
                                    <div class="col-md-2 col-4">
                                        <div class="form-group">
                                             <label for="nbreChevaux">Nbre chevaux</label>
                                            <input type="number" placeholder="ex: 2" class="form-control"  name="nbre_chevaux" required>
                                        </div>
                                    </div>
                                    <div class="col-md-4 col-8">
                                        <div class="form-group radio_input mt-4">
                                            <label for="assurance">Assurance :</label>
                                            <label class="container_radio mr-3">Non
                                                <input type="radio" id="assurance" name="assurance" value="non" required>
                                                <span class="checkmark"></span>
                                            </label>
                                            <label class="container_radio">Oui
                                                <input type="radio" id="assurance" name="assurance" value="oui" required>
                                                <span class="checkmark"></span>
                                            </label>
                                        </div>
                                    </div>
                                </div>

                                <div id="assure-section" class="d-none form-section">
                                    <h5>Assurance *</h5>
                                    <div class="conjoint-group border p-3 mb-3">
                                        <div class="form-row">
                                            <div class="form-group col-md-6">
                                                <label for="assureur">Assureur *</label>
                                                <input type="text" placeholder="entrez le nom de l'assureur" class="form-control" id="assureur" name="police_assurance">
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label for="validiteAssurance">Validité assurance *</label>
                                                <input type="date" class="form-control" id="validiteAssurance" name="validite_assurance">
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-section">
                                    <h5>Informations achat vehicule *</h5>
                                    <div class="conjoint-group border p-3 mb-3">
                                        <div class="form-row">
                                            <div class="form-group col-md-4">
                                                <label for="Prix d'achat">Prix achat $ *</label>
                                                <input type="number" placeholder="entrez le prix d'achat de la vehicule" class="form-control" id="prixAchat" name="achat[achat_prix]">
                                            </div>
                                            <div class="form-group col-md-4">
                                                <label for="Date d'achat">Date d'achat *</label>
                                                <input type="date" class="form-control" id="dateAchat" name="achat[achat_date]">
                                            </div>
                                            <div class="form-group col-md-4">
                                                <label for="vendeur">NIP Vendeur *</label>
                                                <input type="text" class="form-control" id="vendeur" placeholder="Entrez le NIP du vendeur" name="achat[nip_vendeur]">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- /row-->
                            </div>
                            <!-- /step-->
                        </div>
                        <!-- /middle-wizard -->
                        <div style="display: flex; justify-content: end;" class="mr-2">
                            <button type="reset" class="btn btn-secondary btn-lg mr-3">Annuler</button>
                            <button type="submit" class="btn btn-success btn-lg"><i class="icon-check-3"></i> Soumettre</button>
                        </div>
                        <!-- /bottom-wizard -->
                    </form>
                </div>
                <!-- /Wizard container -->
            </div>
        </div>
        <!-- /Row -->
    </div>
    <!-- /Form_container -->
@endsection

@section("scripts")
<script src="{{asset('assets/js/app.js') }}"></script>
 <script>
    document.addEventListener('DOMContentLoaded', function() {
        @if(session('code'))
            const code = '{{ session('code') }}';
            Swal.fire({
                title: 'Veuillez imprimer le qrcode !',
                html: `<div id="qrcode"></div><br><p>${code}</p>`,
                showCancelButton: true,
                confirmButtonText: 'Imprimer',
                cancelButtonText: 'Fermer',
                didOpen: () => {
                    // Générer le QR code
                    const qrCode = new QRCodeStyling({
                        width: 500,
                        height: 500,
                        data: code,
                        image: "https://example.com/path/to/your/image.png", // Replace with your image URL
                        dotsOptions: {
                            color: "#007fff", // Blue color for dots
                            type: "rounded"
                        },
                        backgroundOptions: {
                            color: "#ffffff", // Background color
                        },
                        imageOptions: {
                            crossOrigin: "anonymous",
                            margin: 20
                        }
                    });
                    qrCode.append(document.getElementById("qrcode"));
                }
            }).then((result) => {
                if (result.isConfirmed) {
                    printQRCode(code);
                }
            });

            function printQRCode(code) {
                // Crée une nouvelle fenêtre pour l'impression
                const printWindow = window.open('', '_blank');
                printWindow.document.write(`
                    <html>
                    <head>
                        <title>Impression QR Code</title>
                    </head>
                    <body>
                        <div id="qrcode"></div><br>
                        <p>${code}</p>
                        <script src="https://cdn.jsdelivr.net/npm/qrcode-styling@1.5.0/lib/qrcode.min.js"></script>
                        <script>
                            const qrCode = new QRCodeStyling({
                                width: 300,
                                height: 300,
                                data: "${code}",
                                image: "https://example.com/path/to/your/image.png", // Replace with your image URL
                                dotsOptions: {
                                    color: "#0000FF", // Blue color for dots
                                    type: "rounded"
                                },
                                backgroundOptions: {
                                    color: "#ffffff", // Background color
                                },
                                imageOptions: {
                                    crossOrigin: "anonymous",
                                    margin: 20
                                }
                            });
                            qrCode.append(document.getElementById("qrcode"));
                            window.onload = function() {
                                window.print();
                                window.onafterprint = function() {
                                    window.close();
                                }
                            }
                        </script>
                    </body>
                    </html>
                `);
                printWindow.document.close();
            }
        @endif
    });
</script>
@endsection
