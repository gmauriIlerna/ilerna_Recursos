document.getElementById("crear").addEventListener("click", ()=>{
    const card=document.createElement("div");
    card.style.border="1px solid #333";
    card.style.padding="10px";
    card.style.margin="10px 0";
    card.textContent="Tarjeta dinámica ";

    const btn=document.createElement("button");
    btn.textContent="Eliminar";
    btn.addEventListener("click", ()=>{
        card.remove()
    });
    card.appendChild(btn);

    document.getElementById("contenedor").appendChild(card);
});