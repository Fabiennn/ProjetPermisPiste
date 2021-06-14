document.querySelectorAll(".mission-container").forEach(mission =>{
    mission.onclick = () =>{
        mission.classList.toggle("active");
        const actionWrapper = mission.querySelector(".action-container-wrapper");
        actionWrapper.style.height = actionWrapper.offsetHeight == 0 ? actionWrapper.firstElementChild.offsetHeight +"px" : 0;
    }
})

const missionSelector = document.getElementById("mission-select");
missionSelector.oninput = () => {
    document.querySelector("p[data-select=mission-id]").innerHTML = "#"+missionSelector.value;
}