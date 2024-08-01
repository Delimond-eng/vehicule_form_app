document.addEventListener("DOMContentLoaded", function () {
    const tabButtons = {
        "vehicule-next-trigger": {
            current: "vehicule-tab-pane",
            next: "assure-tab-pane",
        },
        "assure-next-trigger": {
            current: "assure-tab-pane",
            next: "photo-tab-pane",
        },
        "photo-next-trigger": {
            current: "photo-tab-pane",
            next: "achat-tab-pane",
        },
        "back-assure-trigger": {
            current: "assure-tab-pane",
            previous: "vehicule-tab-pane",
        },
        "back-photo-trigger": {
            current: "photo-tab-pane",
            previous: "assure-tab-pane",
        },
        "back-achat-trigger": {
            current: "achat-tab-pane",
            previous: "photo-tab-pane",
        },
    };

    function activateTab(tabId) {
        const tabElement = document.getElementById(tabId);
        if (tabElement) {
            tabElement.classList.add("show", "active");
            const tabButton = document.querySelector(
                `button[data-bs-target="#${tabId}"]`
            );
            if (tabButton) {
                tabButton.classList.add("active");
            }
        }
    }

    function deactivateTab(tabId) {
        const tabElement = document.getElementById(tabId);
        if (tabElement) {
            tabElement.classList.remove("show", "active");
            const tabButton = document.querySelector(
                `button[data-bs-target="#${tabId}"]`
            );
            if (tabButton) {
                tabButton.classList.remove("active");
            }
        }
    }

    function handleTabSwitch(event) {
        const triggerId = event.target.id;
        const tabInfo = tabButtons[triggerId];

        if (tabInfo) {
            if (tabInfo.current && tabInfo.next) {
                deactivateTab(tabInfo.current);
                activateTab(tabInfo.next);
            } else if (tabInfo.current && tabInfo.previous) {
                deactivateTab(tabInfo.current);
                activateTab(tabInfo.previous);
            }
        }
    }

    Object.keys(tabButtons).forEach((triggerId) => {
        const triggerElement = document.getElementById(triggerId);
        if (triggerElement) {
            triggerElement.addEventListener("click", handleTabSwitch);
        }
    });
});
