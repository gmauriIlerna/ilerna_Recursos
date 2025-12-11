let inventario = {
    productos: [
        { nombre: "Teclado", precio: 20, stock: 15 },
        { nombre: "Ratón", precio: 10, stock: 30 },
        { nombre: "Monitor", precio: 120, stock: 8 }
    ]
};

// ---------------------------------------------
// 1. Mostrar los nombres de todos los productos
// ---------------------------------------------
console.log("Nombres de los productos:");

for (let i = 0; i < inventario.productos.length; i++) {
    let producto = inventario.productos[i];
    console.log(producto.nombre);
}

// ---------------------------------------------
// 2. Añadir un nuevo producto
// ---------------------------------------------
let nuevoProducto = {
    nombre: "Altavoces",
    precio: 25,
    stock: 10
};

inventario.productos.push(nuevoProducto);

// ---------------------------------------------
// 3. Subir el precio del monitor un 10%
// ---------------------------------------------
for (let i = 0; i < inventario.productos.length; i++) {
    let producto = inventario.productos[i];
    
    if (producto.nombre === "Monitor") {
        producto.precio = producto.precio * 1.10;
    }
}

// ---------------------------------------------
// 4. Eliminar el producto "Ratón"
// ---------------------------------------------
for (let i = 0; i < inventario.productos.length; i++) {
    let producto = inventario.productos[i];

    if (producto.nombre === "Ratón") {
        inventario.productos.splice(i, 1);
        i = inventario.productos.length; // Salir del bucle después de eliminar
    }
}

// Mostrar el inventario final
console.log("Inventario actualizado:");
console.log(inventario);