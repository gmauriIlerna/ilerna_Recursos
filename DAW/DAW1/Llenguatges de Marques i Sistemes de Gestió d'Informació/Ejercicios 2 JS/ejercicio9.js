const box=document.getElementById("caja");

document.getElementById("up").addEventListener("click", ()=>{
    const p = document.createElement("p");
    p.textContent="Insertado arriba";

    box.insertAdjacentElement("beforebegin", p);
    //box.insertAdjacentHTML("beforebegin", "<p>Insertado arriba</p>");
});

document.getElementById("down").addEventListener("click", ()=>{
    const p = document.createElement("p");
    p.textContent="Insertado abajo";

    box.insertAdjacentElement("afterend", p);
    //box.insertAdjacentHTML("afterend", "<p>Insertado abajo</p>");
});