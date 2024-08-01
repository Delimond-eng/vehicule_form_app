document.addEventListener("DOMContentLoaded", function () {
    submitData();
});

function submitData() {
    document
        .getElementById("myForm")
        .addEventListener("submit", function (event) {
            event.preventDefault(); // Empêcher le formulaire de se soumettre normalement

            var formData = new FormData(this);

            // Récupérer le bouton et le loader
            var submitBtn = document.getElementById("submitBtn");
            var loader = document.getElementById("loading");
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
                    // Gérer la réponse JSON
                    if (data.success) {
                        // Afficher un message de succès similaire à celui de Blade

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
                                    const timer = setInterval(function () {
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
                            }).then((result) => {
                                window.location.href = "/";
                            });
                        }
                    } else if (data.errors) {
                        Swal.fire({
                            icon: "error",
                            title: `Echec de traitement de la requête !`,
                            html: `<ul>
                                    ${data.errors
                                        .map((error) => `<li>${error}</li>`)
                                        .join("\n")}
                                </ul>`,
                        });
                    } else if (data.error) {
                        Swal.fire({
                            icon: "error",
                            title: `Echec de traitement de la requête !`,
                            text: data.error,
                        });
                    }

                    // Réactiver le bouton et cacher le loader après la réponse
                    submitBtn.disabled = false;
                    loader.classList.add("d-none");
                    btnText.textContent = "Sauvegarder"; // Remettre le texte initial du bouton
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
                    btnText.textContent = "Sauvegarder"; // Remettre le texte initial du bouton
                });
        });
}
