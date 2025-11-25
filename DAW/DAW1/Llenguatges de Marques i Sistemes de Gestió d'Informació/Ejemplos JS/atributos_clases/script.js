const img = document.getElementById("imagen");
const texto = document.getElementById("texto");
const btnSrc = document.getElementById("cambiarSrc");
const btnClass = document.getElementById("toggleClass");

btnSrc.addEventListener("click", () => {
    if(img.getAttribute("src") === "https://picsum.photos/200") {
        img.setAttribute("src", "https://picsum.photos/300");
    } else {
        img.setAttribute("src", "https://picsum.photos/200");
    }
});

btnClass.addEventListener("click", () => {
    texto.classList.toggle("destacado");
});