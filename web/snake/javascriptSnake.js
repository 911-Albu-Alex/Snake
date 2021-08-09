document.addEventListener("DOMContentLoaded", function () {
    pTag = document.querySelector("div");
    newVal = document.createElement("p");
    localStorage.setItem("highscore", String(highscore));
    newVal.innerHTML = '';
    pTag.appendChild(newVal);
});