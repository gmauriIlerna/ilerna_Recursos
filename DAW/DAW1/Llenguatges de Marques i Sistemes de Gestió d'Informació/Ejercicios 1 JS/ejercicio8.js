let count = 0;
let boton =  document.getElementById("boton");

boton.addEventListener("click", () => {
    count++;
    document.getElementById('contador').textContent = count;
});