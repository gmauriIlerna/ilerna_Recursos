let boton = document.getElementById("boton");

boton.addEventListener("click", () => {
    const a = Number(document.getElementById('n1').value);
    const b = Number(document.getElementById('n2').value);
    document.getElementById('resultadoSuma').textContent = a + b;
});