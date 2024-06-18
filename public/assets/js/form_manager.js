document.addEventListener("DOMContentLoaded", function() {
    submitData();
});

function submitData() {
    document
        .getElementById("wrapped")
        .addEventListener("submit", function(event) {
                event.preventDefault(); // Empêcher le formulaire de se soumettre normalement

                var formData = new FormData(this);

                // Récupérer le bouton et le loader
                var submitBtn = document.getElementById("submitBtn");
                var loader = document.getElementById("loader");
                var btnText = document.getElementById("btnText");

                // Désactiver le bouton et afficher le loader
                submitBtn.disabled = true;
                loader.classList.remove("d-none");
                btnText.textContent = "Soumettre"; // Optionnel : changer le texte du bouton

                // Récupérer le jeton CSRF depuis la balise meta
                var csrfToken = document
                    .querySelector('meta[name="csrf-token"]')
                    .getAttribute("content");

                // Utiliser fetch pour envoyer les données du formulaire
                fetch(this.getAttribute("action"), {
                        method: "POST",
                        body: formData,
                        headers: {
                            "X-CSRF-TOKEN": csrfToken, // Ajouter le jeton CSRF dans les en-têtes
                        },
                    })
                    .then((response) => {
                        if (!response.ok) {
                            return response.json().then((errorData) => {
                                throw new Error(JSON.stringify(errorData));
                            });
                        }
                        return response.json(); // Convertir la réponse en JSON
                    })
                    .then((data) => {
                            document
                                .getElementById("header")
                                .scrollIntoView({ behavior: "smooth" });
                            // Gérer la réponse JSON
                            if (data.success) {
                                // Afficher un message de succès similaire à celui de Blade
                                var successAlert = `
                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                        ${data.success}, le numéro d'identification est : <strong>${data.code}</strong>
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                `;
                                document.getElementById("alerts").innerHTML =
                                    successAlert;

                                // Gérer l'affichage du QR code si nécessaire
                                if (data.type_use !== "Personnel") {
                                    Swal.fire({
                                        icon: "success",
                                        title: `NPI Vehicule : ${data.code}`,
                                        text: "Opération effectuée avec succès",
                                        showCancelButton: true,
                                        confirmButtonText: "Imprimer",
                                        cancelButtonText: "Fermer",
                                    }).then((result) => {
                                        if (result.isConfirmed) {
                                            // Ouvrir une nouvelle fenêtre pour l'impression
                                            const printWindow = window.open(
                                                `/print/${data.code}`,
                                                "_blank"
                                            );
                                            // Ajouter un listener pour détecter la fermeture de la fenêtre
                                            const timer = setInterval(function() {
                                                if (printWindow.closed) {
                                                    clearInterval(timer);
                                                    // Rediriger vers la page d'accueil après l'impression
                                                    window.location.href = "/";
                                                }
                                            }, 1000);
                                        }
                                    });
                                } else {
                                    // Afficher un message de succès pour un usage personnel
                                    Swal.fire({
                                        icon: "success",
                                        title: `NPI Vehicule : ${data.code}`,
                                        text: "Opération effectuée avec succès",
                                        showCancelButton: false,
                                        showConfirmButton: true,
                                    }).then((result) => {
                                        window.location.href = "/";
                                    });
                                }
                            } else if (data.errors) {
                                // Afficher les erreurs de validation
                                var errorAlert = `
                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        <ul>
                            ${data.errors
                                .map((error) => `<li>${error}</li>`)
                                .join("")}
                        </ul>
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                `;
                        document.getElementById("alerts").innerHTML =
                            errorAlert;
                    } else if (data.error) {
                        // Afficher une erreur générique
                        var errorAlert = `
                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        ${data.error}
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                `;
                        document.getElementById("alerts").innerHTML =
                            errorAlert;
                    }

                    // Réactiver le bouton et cacher le loader après la réponse
                    submitBtn.disabled = false;
                    loader.classList.add("d-none");
                    btnText.textContent = "Soumettre"; // Remettre le texte initial du bouton
                })
                .catch((error) => {
                    console.error(
                        "Erreur lors de la soumission du formulaire:",
                        error
                    );
                    alert("Erreur réseau : Veuillez réessayer."); // Gérer les erreurs réseau ou autres

                    // Réactiver le bouton et cacher le loader en cas d'erreur
                    submitBtn.disabled = false;
                    loader.classList.add("d-none");
                    btnText.textContent = "Soumettre"; // Remettre le texte initial du bouton
                });
        });
}
