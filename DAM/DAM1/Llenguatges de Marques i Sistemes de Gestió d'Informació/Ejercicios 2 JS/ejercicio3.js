const box=document.getElementById("box");

document.getElementById("arriba").addEventListener("click", ()=>{
    box.before("Insertado arriba");
});

document.getElementById("abajo").addEventListener("click", ()=>{
    box.after("Insertado abajo");
});