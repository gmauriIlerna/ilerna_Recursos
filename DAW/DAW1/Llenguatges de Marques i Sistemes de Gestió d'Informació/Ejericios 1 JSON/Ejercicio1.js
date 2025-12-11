let persona = {
    nombre: "Ana",
    edad: 22,
    ciudad: "Valencia"
};

console.log(persona.nombre);
persona.ciudad = "Madrid";
persona.profesion = "Ingeniera";
delete persona.edad;
console.log(persona);
