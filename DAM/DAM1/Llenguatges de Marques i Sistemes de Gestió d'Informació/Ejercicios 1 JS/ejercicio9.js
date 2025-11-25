let boton =  document.getElementById("boton");

boton.addEventListener("click", () => {
    const n = document.getElementById('nombreC').value;
    const a = document.getElementById('apellidoC').value;
    document.getElementById('resultadoNombre').textContent =
        "Te llamas: " + n + " " + a;
});