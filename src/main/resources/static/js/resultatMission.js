document.querySelectorAll(".action-box").forEach(box => {
    box.onclick = () =>{
        box.classList.toggle("active");
        const wrapper = box.querySelector(".action-detail-wrapper");
        wrapper.style.height = wrapper.offsetHeight == 0 ? wrapper.firstElementChild.offsetHeight+"px" : 0;
    }
});

gsap.fromTo(".announcement", {opacity: 0, scale: 2}, {opacity: 1, scale: 1, duration: 1, delay: 2.2});

gsap.fromTo(".details", {opacity:0, x:-10}, {opacity:1, x:0, delay: 3.5});