let usuarios = { lista: [] };

document.getElementById("btn").addEventListener("click", () => {
    const u = {
        nombre: document.getElementById("nombre").value,
        email: document.getElementById("email").value,
        edad: parseInt(document.getElementById("edad").value)
    };
    
    usuarios.lista.push(u);
    console.log(usuarios.lista);
});