document.getElementById("btn").addEventListener("click", ()=>{
    const p=document.createElement("p");
    p.textContent="Párrafo creado dinámicamente.";
    document.body.appendChild(p);
});