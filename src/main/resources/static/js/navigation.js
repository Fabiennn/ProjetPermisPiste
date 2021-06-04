
function toggleDropDown(event){
    const button = event.target;
    const subMenu = button.nextElementSibling;
    button.classList.toggle("active");
    subMenu.classList.toggle("active");
    console.log(subMenu.classList.contains('active'))
    if(subMenu.classList.contains('active')){
        const wrapperHeight = subMenu.firstElementChild.offsetHeight;
        subMenu.style.height = `${wrapperHeight}px`;
    }else{
        subMenu.style.height = `0`;
    }
}

document.querySelectorAll(".drop-title").forEach(button => {
    button.onclick = toggleDropDown;
})

function toggleNavBar(){
    document.querySelector(".navbar2-nav").classList.toggle('active');
    document.querySelector(".navbar-min .nav-btn").classList.toggle('active');
}
