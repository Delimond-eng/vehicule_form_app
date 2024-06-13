document.addEventListener('DOMContentLoaded', function (e){
    //Remise des zones de saisie en blanc
    document.getElementById('user-form').reset();
    document.getElementById("ministereSection").classList.add("d-none");
    document.getElementById("secretariatSection").classList.add("d-none");
    document.getElementById("directionSection").classList.add("d-none");

    document.getElementById('access-select').addEventListener('change', function (){
        const value = this.value;
        checkRole(value);
    });

    // Écouteur d'événement onchange pour le select du ministère
    document.getElementById('ministere-select').addEventListener('change', function() {
        const ministryId = this.value; // Récupérer la valeur sélectionnée du ministère
        makeSelectEmpty('secretariat-select', 'un secrétariat');
        makeSelectEmpty('direction-select', 'une direction');
        loadStep('secretariats', 'secretariat-select', ministryId, 'secretariat_libelle')
            .then(() =>console.log('secretariats loaded'));
    });

    // Écouteur d'événement onchange pour le select du secrétariat
    document.getElementById('secretariat-select').addEventListener('change', function() {
        const secretariatId = this.value; // Récupérer la valeur sélectionnée du secrétariat
        makeSelectEmpty('direction-select', 'une direction');
        loadStep('directions', 'direction-select', secretariatId, 'direction_libelle')
            .then(() => console.log('directions loaded'));
    });
});

function loadOptions(selectId, options, labelKey) {
    const selectElement = document.getElementById(selectId);
    // Ajouter chaque option à partir des données reçues
    options.forEach(option => {
        const optionElement = document.createElement('option');
        optionElement.value = option.id;
        optionElement.textContent = option[labelKey];
        selectElement.appendChild(optionElement);
    });
}

// Fonction pour charger les options pour une étape donnée
function loadStep(step, selectId, parentId, labelKey) {
    return fetch('/load.' + step + '/' + parentId)
        .then(response => response.json())
        .then(data => {
            console.log(data)
            loadOptions(selectId, data, labelKey);
        });
}

function makeSelectEmpty(selectId, message){
    document.getElementById(selectId).innerHTML = `<option selected hidden>Sélectionnez ${message}...</option>`;
}

function checkRole(value){
    switch (value){
        case "ministre":
            makeVisible('ministereSection')
            break;
        case "secretaire":
            makeVisible('ministereSection');
            makeVisible('secretariatSection');
            hideSection('directionSection');
            break
        case "directeur":
            makeVisible('directionSection');
            makeVisible('ministereSection');
            makeVisible('secretariatSection');
            break
        case "drh":
            makeVisible('ministereSection');
            makeVisible('secretariatSection');
            hideSection('directionSection');
            break
        default:
            hideSection('directionSection');
            hideSection('ministereSection');
            hideSection('secretariatSection');
    }
}

function makeVisible(sectionId){
    document.getElementById(sectionId).classList.remove("d-none");
}
function hideSection(sectionId){
    document.getElementById(sectionId).classList.add("d-none");
}
