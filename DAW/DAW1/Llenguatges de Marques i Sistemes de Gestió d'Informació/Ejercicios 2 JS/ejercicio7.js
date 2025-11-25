document.getElementById("add").addEventListener("click", ()=>{
    const txt=document.getElementById("tarea").value.trim();
    
    if(txt){
        const li=document.createElement("li");
        li.textContent=txt;
        document.getElementById("lista").appendChild(li);
        document.getElementById("tarea").value="";
    }
});