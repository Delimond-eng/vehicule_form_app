document.addEventListener("DOMContentLoaded", function () {
    cameraManager("video-preview1", "photo-preview1", "capture-btn1", "photo1");
    cameraManager("video-preview2", "photo-preview2", "capture-btn2", "photo2");
    cameraManager("video-preview3", "photo-preview3", "capture-btn3", "photo3");
    cameraManager("video-preview4", "photo-preview4", "capture-btn4", "photo4");

    //formatte plaque input
    formatPlaque();

    //formatte les NPI Fields
    formatInputNPI("npiChauffeur");
    formatInputNPI("nipProprietaire");

    //verification de NPI du proprietaire pour afficher les infos y afferent
    checkNPI(
        "nipInfoProprietaire",
        "npiProprietaireInfoInput",
        "nipProprietaire"
    );
    //Verification de NPI Chauffeur pour afficher les infos y afferent
    checkNPI("npiChauffeurInfo", "npiChauffeurInfoInput", "npiChauffeur");
    addAssuranceSection();
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

    captureBtn.addEventListener("click", function () {
        if (!isCameraActive) {
            videoPreview.classList.remove("d-none");
            photoPreview.classList.add("d-none");
            captureBtn.innerHTML =
                '<i class="icon-camera-1 mr-1"></i>Faire capture';

            // Déterminer les contraintes vidéo en fonction du type d'appareil
            const constraints = {
                video: {
                    facingMode: isMobileDevice()
                        ? { ideal: "environment" }
                        : "user",
                },
            };

            navigator.mediaDevices
                .getUserMedia(constraints)
                .then(function (stream) {
                    videoStream = stream;
                    video.srcObject = stream;
                    video.play();
                    videoPreview.srcObject = stream;
                    isCameraActive = true;
                })
                .catch(function (error) {
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

    photoInput.addEventListener("change", function (event) {
        const file = event.target.files[0];
        const reader = new FileReader();
        reader.onload = function (e) {
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

    input.addEventListener("input", function () {
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

function formatInputNPI(id) {
    var inputElement = document.getElementById(id);

    // Ajoute le préfixe lorsque l'input reçoit le focus
    inputElement.addEventListener("focus", function () {
        if (inputElement.value === "") {
            inputElement.value = "KN-P-";
        }
    });

    // Formatte l'input lors de la saisie
    inputElement.addEventListener("input", function () {
        var value = inputElement.value.toUpperCase(); // Convertir en majuscules
        var formattedValue = "KN-P-"; // Préfixe fixe

        // Supprimer le préfixe fixe de la valeur de l'entrée
        if (value.startsWith("KN-P-")) {
            value = value.slice(5);
        } else {
            value = "";
        }

        // Conserver uniquement les caractères alphanumériques
        value = value.replace(/[^A-Z0-9]/g, "");

        // Diviser en parties : 4 chiffres et 3 lettres
        var digits = value.substring(0, 4);
        var letters = value.substring(4, 7);

        // Construire la valeur formatée
        if (digits.length > 0) {
            formattedValue += digits;
        }
        if (letters.length > 0) {
            formattedValue += "-";
            formattedValue += letters;
        }

        // Limiter à la longueur attendue (14 caractères au total)
        formattedValue = formattedValue.slice(0, 13); // "KN-P-0000-AAA"

        inputElement.value = formattedValue;
    });

    // Vide l'input si rien n'est saisi lorsque le focus est perdu
    inputElement.addEventListener("blur", function () {
        if (inputElement.value === "KN-P-") {
            inputElement.value = "";
        }
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

    nipInput.addEventListener("input", function () {
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
    typeAssurances.forEach(function (type) {
        options += `<option value="${type.id}">${type.type_assurance_libelle}</option>`;
    });
    return options;
}

// Fonction pour créer une nouvelle section d'assurance
function createAssuranceSection(index) {
    return `
        <div class="col-xl-12 assurance-section mb-3" id="assurance-section-${index}">
            <div class="card custom-card border shadow-none">
                <div class="card-header d-flex justify-content-between w-100">
                    <div class="card-title">
                        Assurance ${index + 1}
                    </div>
                    <button type="button" class="btn btn-danger btn-sm btn-icon btn-delete" data-index="${index}">
                        <i class="ri-close-line"></i>
                    </button>
                </div>
                <div class="card-body">
                    <div class="row gy-3">
                        <div class="col-xl-6">
                            <div class="form-floating mb-3">
                                <input type="text" placeholder="entrez le numéro de la police d'assurance" class="form-control" name="assurances[${index}][numero_police]">
                                <label for="numero_police">Numéro de la Police d'assurance *</label>
                            </div>
                        </div>
                        <div class="col-xl-6">
                            <div class="form-floating mb-3">
                                <select name="assurances[${index}][type_assurance_id]" class="form-control">
                                    ${createTypeAssuranceOptions()}
                                </select>
                                <label for="type_assurance_id">Type d'assurance *</label>
                            </div>
                        </div>
                        <div class="col-xl-6">
                            <div class="form-floating mb-3">
                                <input type="text" placeholder="entrez le nom de l'assureur" class="form-control" name="assurances[${index}][nom_assureur]">
                                <label for="nom_assureur">Assureur *</label>
                            </div>
                        </div>
                        <div class="col-xl-6">
                            <div class="form-floating mb-3">
                                <input type="date" class="form-control" name="assurances[${index}][date_validite]">
                                <label for="date_validite">Validité assurance *</label>
                            </div>
                        </div>
                    </div>
                    <button type="button" class="btn btn-primary btn-sm add-assurance-button">
                        <i class="ri-add-line me-1 align-middle fs-14 fw-semibold d-inline-block"></i> Ajouter assurance
                    </button>
                </div>
            </div>
        </div>`;
}

function addAssuranceSection() {
    var sectionContent = document.querySelector(".assure-content");
    var index = sectionContent.querySelectorAll(".assurance-section").length;
    var newSection = createAssuranceSection(index);
    sectionContent.insertAdjacentHTML("beforeend", newSection);

    // Ajouter les gestionnaires d'événements pour tous les boutons "Ajouter assurance"
    document
        .querySelectorAll(".add-assurance-button")
        .forEach(function (button) {
            button.removeEventListener("click", addAssuranceSection); // Remove previous event listeners to avoid multiple bindings
            button.addEventListener("click", addAssuranceSection);
        });

    // Ajouter les gestionnaires d'événements pour tous les boutons "Supprimer assurance"
    document.querySelectorAll(".btn-delete").forEach(function (button) {
        button.removeEventListener("click", removeAssuranceSection); // Remove previous event listeners to avoid multiple bindings
        button.addEventListener("click", removeAssuranceSection);
    });

    updateDeleteButtons();
}

function updateDeleteButtons() {
    var sections = document.querySelectorAll(".assurance-section");
    if (sections.length > 1) {
        sections.forEach(function (section) {
            section.querySelector(".btn-delete").style.display = "block";
        });
    } else {
        sections.forEach(function (section) {
            section.querySelector(".btn-delete").style.display = "none";
        });
    }
}

function removeAssuranceSection(event) {
    var index = event.currentTarget.getAttribute("data-index");
    document.getElementById(`assurance-section-${index}`).remove();
    updateIndexes();
    updateDeleteButtons();
}

// Fonction pour mettre à jour les index après une suppression
function updateIndexes() {
    var sections = document.querySelectorAll(".assurance-section");
    sections.forEach(function (section, newIndex) {
        section.id = `assurance-section-${newIndex}`;
        section
            .querySelector(".btn-delete")
            .setAttribute("data-index", newIndex);
        section.querySelector(".card-title").textContent = `Assurance ${
            newIndex + 1
        }`;
        section.querySelectorAll("input, select").forEach(function (input) {
            var name = input
                .getAttribute("name")
                .replace(/\[\d+\]/, `[${newIndex}]`);
            input.setAttribute("name", name);
        });
    });
}
