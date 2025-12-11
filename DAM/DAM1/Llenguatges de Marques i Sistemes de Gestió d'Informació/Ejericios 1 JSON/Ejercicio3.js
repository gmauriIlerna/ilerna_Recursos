let pelicula = {
    titulo: "Interstellar",
    director: {
        nombre: "Christopher Nolan",
        edad: 53
    },
    reparto: [
        { nombre: "Matthew McConaughey", personaje: "Cooper" },
        { nombre: "Anne Hathaway", personaje: "Brand" }
    ]
};

// ---------------------------------------------
// 1. Añadir un nuevo actor al reparto
// ---------------------------------------------
let nuevoActor = {
    nombre: "Jessica Chastain",
    personaje: "Murph"
};

pelicula.reparto.push(nuevoActor);

// ---------------------------------------------
// 2. Cambiar la edad del director
// ---------------------------------------------
pelicula.director.edad = 54;

// ---------------------------------------------
// 3. Mostrar los nombres de todos los actores
// ---------------------------------------------
console.log("Actores de la película:");

for (let i = 0; i < pelicula.reparto.length; i++) {
    let actor = pelicula.reparto[i];
    console.log(actor.nombre);
}

// ---------------------------------------------
// 4. Añadir una nueva clave 'año' al JSON
// ---------------------------------------------
pelicula.año = 2014;

// Mostrar el resultado final
console.log("Película actualizada:");
console.log(pelicula);