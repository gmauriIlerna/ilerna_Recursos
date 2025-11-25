let boton = document.getElementById("boton");

boton.addEventListener("click", () => {
    const nombre = document.getElementById('nombreInput').value;
    document.getElementById('resultadoSaludo').textContent = "Hola, " + nombre;
});