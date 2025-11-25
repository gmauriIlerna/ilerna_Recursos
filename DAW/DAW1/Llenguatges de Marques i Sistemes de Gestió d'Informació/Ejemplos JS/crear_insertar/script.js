const btn = document.getElementById("add");
const container = document.getElementById("container");
let cont = 0;

btn.addEventListener("click", () => {
    const p = document.createElement("p");
    cont++;
    p.textContent = "Párrafo creado dinámicamente. Número: " + cont;
    //container.appendChild(p);
    container.insertAdjacentElement("afterbegin", p);
});