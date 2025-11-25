let contador=1;

document.getElementById("add").addEventListener("click", ()=>{
    const li=document.createElement("li");
    li.textContent="Elemento "+ contador;
    contador++;
    document.getElementById("lista").appendChild(li);
});