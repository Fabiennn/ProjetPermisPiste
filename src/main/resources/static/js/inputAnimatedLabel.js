document.querySelectorAll("input[type=text], input[type=password]").forEach((input) => {
        input.oninput = inputChanged;
    });

function inputChanged(event) {
    const input = event.target;
    const label = document.querySelector(
        `label[for=${input.id}] > .animated-label`
    );
    if (input.value !== "" && !label.classList.contains("non-empty")) {
        label.classList.add("non-empty");
    } else if (input.value === "" && label.classList.contains("non-empty")) {
        label.classList.remove("non-empty");
    }
}