const fs = require("fs");
const path = require("path");

// Ruta al archivo JSON
const filePath = path.join(__dirname, "data.json");

// Leer y parsear el archivo JSON
const rawData = fs.readFileSync(filePath, "utf8");
let data = JSON.parse(rawData);

// Mostrar el contenido del archivo JSON en la consola
console.log("Before", data);

// Editar el contenido del archivo JSON
data.age = 26;
data.city = "Madrid";

// Escribir los cambios de vuelta al archivo JSON
fs.writeFileSync(filePath, JSON.stringify(data, null, 2));

// Mostrar el contenido modificado en la consola
console.log("After:", data);