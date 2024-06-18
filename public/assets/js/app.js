document.addEventListener("DOMContentLoaded", function() {
    cameraManager("video-preview1", "photo-preview1", "capture-btn1", "photo1");
    cameraManager("video-preview2", "photo-preview2", "capture-btn2", "photo2");
    cameraManager("video-preview3", "photo-preview3", "capture-btn3", "photo3");
    cameraManager("video-preview4", "photo-preview4", "capture-btn4", "photo4");

    //formatte plaque input
    formatPlaque();

    //verification de NPI du proprietaire pour afficher les infos y afferent
    checkNPI(
        "nipInfoProprietaire",
        "npiProprietaireInfoInput",
        "nipProprietaire"
    );
    //Verification de NPI Chauffeur pour afficher les infos y afferent
    checkNPI("npiChauffeurInfo", "npiChauffeurInfoInput", "npiChauffeur");

    var assuranceRadios = document.querySelectorAll('input[name="assurance"]');
    var assureSection = document.getElementById("assure-section");
    // Ajout d'un écouteur d'événement pour le changement d'état des boutons radio
    assuranceRadios.forEach(function(radio) {
        radio.addEventListener("change", toggleAssureSection);
    });
    toggleAssureSection();

    // Fonction pour basculer la visibilité de la section d'assurance
    function toggleAssureSection() {
        var selectedValue = document.querySelector(
            'input[name="assurance"]:checked'
        ).value;
        if (selectedValue === "oui") {
            assureSection.classList.remove("d-none");
            addAssuranceSection();
        } else {
            assureSection.classList.add("d-none");
            removeAssuranceSections();
        }
    }
});

function cameraManager(
    videoPreviewId,
    photoPreviewId,
    btnCaptureId,
    photoInputId
) {
    const videoPreview = document.getElementById(videoPreviewId);
    const photoPreview = document.getElementById(photoPreviewId);
    const captureBtn = document.getElementById(btnCaptureId);
    const photoInput = document.getElementById(photoInputId);
    let videoStream = null;
    let isCameraActive = false;
    const video = document.createElement("video");

    captureBtn.addEventListener("click", function() {
        if (!isCameraActive) {
            videoPreview.classList.remove("d-none");
            photoPreview.classList.add("d-none");
            captureBtn.innerHTML =
                '<i class="icon-camera-1 mr-1"></i>Faire capture';

            // Déterminer les contraintes vidéo en fonction du type d'appareil
            const constraints = {
                video: {
                    facingMode: isMobileDevice() ?
                        { ideal: "environment" } :
                        "user",
                },
            };

            navigator.mediaDevices
                .getUserMedia(constraints)
                .then(function(stream) {
                    videoStream = stream;
                    video.srcObject = stream;
                    video.play();
                    videoPreview.srcObject = stream;
                    isCameraActive = true;
                })
                .catch(function(error) {
                    console.error("Error accessing camera: ", error);
                });
        } else {
            captureBtn.innerHTML =
                '<i class="icon-camera-1 mr-1"></i>Lancer caméra';
            // Code pour capturer une image et l'affecter à photoInput
            let canvas = document.createElement("canvas");
            canvas.width = video.videoWidth;
            canvas.height = video.videoHeight;
            canvas.getContext("2d").drawImage(video, 0, 0);
            const imageDataURL = canvas.toDataURL("image/png");
            photoPreview.src = imageDataURL;
            const photoFile = dataURLtoBlob(imageDataURL); // Convertir l'URL de données en Blob

            // Créer un objet File à partir du Blob
            const fileOptions = { type: "image/png" };
            const photoBlob = new File([photoFile], "photo.png", fileOptions);

            // Créer un FileList contenant le File
            const fileList = new DataTransfer();
            fileList.items.add(photoBlob);

            // Affecter le FileList à l'input photo
            photoInput.files = fileList.files;

            // Arrêter la diffusion vidéo
            videoStream.getTracks().forEach((track) => track.stop());

            // Afficher l'image capturée
            photoPreview.classList.remove("d-none");
            videoPreview.classList.add("d-none");
            isCameraActive = false;
        }
    });

    photoInput.addEventListener("change", function(event) {
        const file = event.target.files[0];
        const reader = new FileReader();
        reader.onload = function(e) {
            photoPreview.src = e.target.result;
            photoPreview.style.display = "block";
            videoPreview.style.display = "none";
            photoPreview.classList.remove("d-none");
            videoPreview.classList.add("d-none");
        };
        reader.readAsDataURL(file);
    });

    // Fonction utilitaire pour convertir une URL de données en Blob
    function dataURLtoBlob(dataURL) {
        const arr = dataURL.split(",");
        const mime = arr[0].match(/:(.*?);/)[1];
        const bstr = atob(arr[1]);
        let n = bstr.length;
        const u8arr = new Uint8Array(n);
        while (n--) {
            u8arr[n] = bstr.charCodeAt(n);
        }
        return new Blob([u8arr], { type: mime });
    }

    // Fonction utilitaire pour détecter si l'appareil est mobile
    function isMobileDevice() {
        return /Mobi|Android|iPhone|iPad|iPod/i.test(navigator.userAgent);
    }
}

function cleanSelect(selectId, message) {
    let select = document.getElementById(selectId);
    select.innerHTML = `<option value="" selected hidden>Sélectionner ${message}</option>`;
}

function formatPlaque() {
    let input = document.getElementById("plaque");

    input.addEventListener("input", function() {
        // Remove all non-alphanumeric characters
        let value = this.value.replace(/[^A-Za-z0-9]/g, "");

        // Insert dashes at appropriate positions
        if (value.length > 2) {
            value = value.slice(0, 2) + "-" + value.slice(2);
        }
        if (value.length > 7) {
            value = value.slice(0, 7) + "-" + value.slice(7, 9);
        }
        // Update the input value
        this.value = value.toUpperCase();
    });
}

function checkNPI(section, sectionInputID, inputID) {
    const nipInput = document.getElementById(inputID);
    const nipInfoDiv = document.getElementById(section);
    const input = document.getElementById(sectionInputID);
    let loader; // Variable pour stocker le loader

    // Fonction pour effectuer la requête
    function fetchNPIData(nip) {
        // Ajouter le loader
        loader = document.createElement("div");
        loader.classList.add(
            "spinner-border",
            "spinner-border-sm",
            "text-primary",
            "mr-2"
        );
        nipInput.parentNode.insertBefore(loader, nipInput.nextSibling);

        fetch(
                `https://formulaireidnat.groupepaixservice.net/api/check.npi/${nip}`
            )
            .then((response) => response.json())
            .then((data) => {
                // Retirer le loader
                if (loader) {
                    loader.remove();
                }

                if (data.status === "success" && data.personne) {
                    const personne = data.personne;
                    const nomComplet = `${personne.nom} ${personne.postnom} ${personne.prenom}`;
                    input.value = nomComplet;
                    nipInfoDiv.classList.remove("d-none");
                } else {
                    nipInfoDiv.classList.add("d-none");
                }
            })
            .catch((error) => {
                // Retirer le loader en cas d'erreur
                if (loader) {
                    loader.remove();
                }

                console.error("Error fetching NPI data:", error);
                nipInfoDiv.classList.add("d-none");
            });
    }

    // Vérifier si l'input contient déjà une donnée lors du chargement de la page
    const initialNip = nipInput.value;
    if (initialNip.length > 4) {
        fetchNPIData(initialNip);
    }

    nipInput.addEventListener("input", function() {
        const nip = this.value;
        if (nip.length > 4) {
            // Supprimer les loaders précédemment ajoutés
            if (loader) {
                loader.remove();
            }
            fetchNPIData(nip);
        } else {
            nipInfoDiv.classList.add("d-none");
        }
    });
}

function createTypeAssuranceOptions() {
    let options =
        '<option value="" selected hidden>Sélectionnez un type d\'assurance...</option>';
    typeAssurances.forEach(function(type) {
        options += `<option value="${type.id}">${type.type_assurance_libelle}</option>`;
    });
    return options;
}

// Fonction pour créer une nouvelle section d'assurance
function createAssuranceSection(index) {
    return `
        <div class="border p-3 mb-1 assurance-section" id="assurance-section-${index}">
            <button type="button" class="btn btn-delete" data-index="${index}" style="display: none;">&times;</button>
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="assureur">Numéro de la Police d'assurance *</label>
                    <input type="text" placeholder="entrez le numéro de la police d'assurance" class="form-control" name="assurances[${index}][numero_police]">
                </div>
                <div class="form-group col-md-6">
                    <label for="type">Type d'assurance *</label>
                    <select name="assurances[${index}][type_assurance_id]" class="form-control">
                        ${createTypeAssuranceOptions()}
                    </select>
                </div>
                <div class="form-group col-md-6">
                    <label for="assureur">Assureur *</label>
                    <input type="text" placeholder="entrez le nom de l'assureur" class="form-control" name="assurances[${index}][nom_assureur]">
                </div>
                <div class="form-group col-md-6">
                    <label for="validiteAssurance">Validité assurance *</label>
                    <input type="date" class="form-control" name="assurances[${index}][date_validite]">
                </div>
            </div>
            <button type="button" class="btn btn-secondary btn-sm add-assurance-button">
                <i class="icon-plus-1"></i> Ajouter assurance
            </button>
        </div>`;
}

function updateDeleteButtons() {
    var sections = document.querySelectorAll(".assurance-section");
    if (sections.length > 1) {
        sections.forEach(function(section) {
            section.querySelector(".btn-delete").style.display = "block";
        });
    } else {
        sections.forEach(function(section) {
            section.querySelector(".btn-delete").style.display = "none";
        });
    }
}

// Fonction pour mettre à jour les index après une suppression
function updateIndexes() {
    var sections = document.querySelectorAll(".assurance-section");
    sections.forEach(function(section, newIndex) {
        section.id = `assurance-section-${newIndex}`;
        section
            .querySelector(".btn-delete")
            .setAttribute("data-index", newIndex);
        section.querySelectorAll("input, select").forEach(function(input) {
            var name = input
                .getAttribute("name")
                .replace(/\[\d+\]/, `[${newIndex}]`);
            input.setAttribute("name", name);
        });
    });
}

// Fonction pour ajouter une nouvelle section d'assurance
function addAssuranceSection() {
    var sectionContent = document.getElementById("section-content");
    var index = sectionContent.querySelectorAll(".border.p-3.mb-1").length;
    var newSection = createAssuranceSection(index);
    sectionContent.insertAdjacentHTML("beforeend", newSection);

    // Ajouter les gestionnaires d'événements pour tous les boutons "Ajouter assurance"
    document
        .querySelectorAll(".add-assurance-button")
        .forEach(function(button) {
            button.removeEventListener("click", addAssuranceSection); // Remove previous event listeners to avoid multiple bindings
            button.addEventListener("click", addAssuranceSection);
        });
    // Ajouter les gestionnaires d'événements pour tous les boutons "Supprimer assurance"
    document.querySelectorAll(".btn-delete").forEach(function(button) {
        button.removeEventListener("click", removeAssuranceSection); // Remove previous event listeners to avoid multiple bindings
        button.addEventListener("click", removeAssuranceSection);
    });
    updateDeleteButtons();
}

function removeAssuranceSection(event) {
    var index = event.target.getAttribute("data-index");
    var section = document.getElementById(`assurance-section-${index}`);
    section.remove();
    updateIndexes();
    updateDeleteButtons();
}

// Fonction pour supprimer toutes les sections d'assurance
function removeAssuranceSections() {
    var sectionContent = document.getElementById("section-content");
    sectionContent.innerHTML = "";
}
