document.querySelector("video").playbackRate = 0.8;

function display(name) {
  const previousDiv = document.querySelector(".context > .active");
  const divToDisplay = document.getElementById(name);
  const timeLine = gsap.timeline();
  timeLine
    .to(previousDiv, {
      x: -10,
      opacity: 0,
      onComplete: () => {
        previousDiv.classList.remove("active");
        divToDisplay.classList.add("active");
      },
    })
    .fromTo(divToDisplay, { x: 10, opacity: 0 }, { x: 0, opacity: 1 });
  if (previousDiv.id === "home" && window.innerWidth <= 600) {
    minimizeBrand()
  }
}

function minimizeBrand(){
  const brand = document.querySelector(".brand");
  const pSVG = brand.firstElementChild;
  const olypist = brand.lastElementChild;
  const timeLine2 = gsap.timeline();
  timeLine2
      .to(pSVG, { width: "40px", height: "42.41px" }, 0)
      .to(olypist, { x: 0, y: 0 }, 0)
      .to(brand, { x: 0 }, 0);
}

document
  .querySelectorAll("input[type=text], input[type=password]")
  .forEach((input) => {
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

document.getElementById("sign-up").onsubmit = (event) => {
  event.preventDefault();
  if (emptyInputs(document.querySelectorAll("#sign-up input"))) return;
  const pC = passwordCheck();
  const email = document.querySelector('#email-signup')
  const eC = emailCheck(email)
  if (pC && eC) event.target.submit();
};

const password = document.getElementById("password-signup");
const password2 = document.getElementById("password-verif");
const errorPassword = document.querySelector(".password-verif > .input-error");

password2.oninput = (event) => {
  if (password.value === password2.value) {
    errorPassword.innerHTML = "&nbsp;";
  }
  inputChanged(event);
};

function passwordCheck() {
  if (password.value != password2.value) {
    errorPassword.innerHTML += "Les mots de passe ne correspondent pas.";
    return false;
  }
  return true;
}

function emailCheck(email){
    let error = document.querySelector(`.${email.id} > .input-error`);
    const re = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    if(!re.test(String(email.value).toLowerCase())){
        error.innerHTML += 'Cet email est invalide';
        return false;
    }
    return true;
}

function emptyInputs(inputs) {
  let error = false;
  inputs.forEach((input) => {
    const errorElement = input.parentElement.querySelector(".input-error");
    if (input.value === "") {
      error = true;
      errorElement.innerHTML = "&nbsp;Obligatoire";
    } else {
      errorElement.innerHTML = "&nbsp;";
    }
  });
  return error;
}

document.getElementById("sign-in").onsubmit = (event) => {
  event.preventDefault();
  if (emptyInputs(document.querySelectorAll("#sign-in input"))) return;
/*  const email = document.querySelector('#email-signin')
  if(emailCheck(email))*/
  event.target.submit();
};
