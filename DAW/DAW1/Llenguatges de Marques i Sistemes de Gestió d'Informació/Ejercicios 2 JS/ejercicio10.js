const lista = document.getElementById("lista");
const elementos = ["Elemento 1", "Elemento 2", "Elemento 3"];

for (let i = 0; i < elementos.length; i++) {
    const li = document.createElement("li");
    li.textContent = elementos[i] + " ";

    const up = document.createElement("button");
    up.textContent = "↑";

    const down = document.createElement("button");
    down.textContent = "↓";

    up.addEventListener("click", () => {
        const prev = li.previousElementSibling;
        if (prev) {
            li.parentNode.insertBefore(li, prev);
        }
    });

    down.addEventListener("click", () => {
        const next = li.nextElementSibling;
        if (next) {
            li.parentNode.insertBefore(next, li);
        }
    });

    li.appendChild(up);
    li.appendChild(down);
    lista.appendChild(li);
}