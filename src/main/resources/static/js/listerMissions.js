document.querySelectorAll(".mission-container:not(.new-mission-container) .mission-grid").forEach(mission =>{
    mission.onclick = () =>{
        missionContainer = mission.parentElement.parentElement;
        missionContainer.classList.toggle("active");
        const actionWrapper = missionContainer.querySelector(".action-container-wrapper");
        actionWrapper.style.height = actionWrapper.offsetHeight == 0 ? actionWrapper.firstElementChild.offsetHeight +"px" : 0;
    }
})

document.querySelector("#new-mission").oninput = (event) =>{
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

document.querySelectorAll("#update-btn").forEach(btn =>{
    btn.onclick = (event)=>{
        event.stopPropagation();
        const orignal = document.querySelector(`#wording-${btn.value}`);
        const input = document.querySelector(`input[data-update="${btn.value}"]`);
        input.onclick = (event) => event.stopPropagation();
        input.addEventListener('keyup', ({key})=> {
            if (key === "Enter") btn.submit()
        })
        orignal.style.display = "none";
        input.type = 'text';
        btn.onclick = (e) => {
            e.stopPropagation();
            btn.type="submit";
            btn.submit();
        };
    }
})

document.querySelectorAll(".mission-select").forEach(select => {
    select.oninput = () => {
        const mission = select.dataset.mission;
        document.querySelector(`p[data-select="${mission}"]`).innerHTML = "#"+select.value;
    }
})