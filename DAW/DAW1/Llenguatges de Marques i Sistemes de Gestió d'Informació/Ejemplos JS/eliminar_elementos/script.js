const crear = document.getElementById("crear");
const cont = document.getElementById("contenedor");
let contador = 0;

crear.addEventListener("click", () => {
    const box = document.createElement("div");
    box.textContent = "Elemento " + contador + " (haz clic para eliminar)";
    box.style.border = "1px solid black";
    box.style.padding = "8px";
    box.style.margin = "6px 0";

    box.addEventListener("click", () => {
        box.remove();
        contador--;
    });
    cont.appendChild(box);
    contador++;
});