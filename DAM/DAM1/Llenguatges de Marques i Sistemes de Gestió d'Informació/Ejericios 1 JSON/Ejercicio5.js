let biblioteca = {
    libros: [
        { titulo: "El Hobbit", autor: "Tolkien", paginas: 310 },
        { titulo: "Dune", autor: "Frank Herbert", paginas: 500 },
        { titulo: "Neuromante", autor: "William Gibson", paginas: 270 }
    ]
};

// ---------------------------------------------
// 1. Buscar libros por autor
// ---------------------------------------------
let autorBuscado = "Tolkien";
let librosPorAutor = [];

for (let i = 0; i < biblioteca.libros.length; i++) {
    let libro = biblioteca.libros[i];

    if (libro.autor === autorBuscado) {
        librosPorAutor.push(libro);
    }
}

console.log("Libros por autor:", librosPorAutor);

// ---------------------------------------------
// 2. Libros con más de 300 páginas
// ---------------------------------------------
let librosLargos = [];

for (let i = 0; i < biblioteca.libros.length; i++) {
    let libro = biblioteca.libros[i];

    if (libro.paginas > 300) {
        librosLargos.push(libro);
    }
}

console.log("Libros largos:", librosLargos);

// ---------------------------------------------
// 3. Añadir un nuevo libro
// ---------------------------------------------
let nuevoLibro = {
    titulo: "Fundación",
    autor: "Asimov",
    paginas: 255
};

biblioteca.libros.push(nuevoLibro);

// ---------------------------------------------
// 4. Títulos ordenados alfabéticamente
// ---------------------------------------------
let titulos = [];

for (let i = 0; i < biblioteca.libros.length; i++) {
    titulos.push(biblioteca.libros[i].titulo);
}

// Ordenar alfabéticamente
titulos.sort();

console.log("Títulos ordenados:", titulos);
