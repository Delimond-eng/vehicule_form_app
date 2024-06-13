document.addEventListener("DOMContentLoaded", function() {
    cameraManager("video-preview1", "photo-preview1", "capture-btn1", "photo1");
    cameraManager("video-preview2", "photo-preview2", "capture-btn2", "photo2");
    cameraManager("video-preview3", "photo-preview3", "capture-btn3", "photo3");
    cameraManager("video-preview4", "photo-preview4", "capture-btn4", "photo4");

    var assuranceRadios = document.querySelectorAll('input[name="assurance"]');
    var assureSection = document.getElementById("assure-section");
    // Ajout d'un écouteur d'événement pour le changement d'état des boutons radio
    assuranceRadios.forEach(function(radio) {
        radio.addEventListener("change", toggleAssureSection);
    });

    // Fonction pour basculer la visibilité de la section d'assurance
    function toggleAssureSection() {
        var selectedValue = document.querySelector(
            'input[name="assurance"]:checked'
        ).value;
        if (selectedValue === "oui") {
            assureSection.classList.remove("d-none");
        } else {
            assureSection.classList.add("d-none");
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
            navigator.mediaDevices
                .getUserMedia({ video: true })
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
}

function cleanSelect(selectId, message) {
    let select = document.getElementById(selectId);
    select.innerHTML = `<option value="" selected hidden>Sélectionner ${message}</option>`;
}