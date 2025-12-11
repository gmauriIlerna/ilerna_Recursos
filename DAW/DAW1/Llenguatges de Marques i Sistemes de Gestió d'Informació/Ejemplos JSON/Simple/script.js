const persons = {personas: [
                    {name: "Bob", 
                    age: 30 ,
                    married: false,},

                    {name: "Alice",
                    age: 25,
                    married: true,},

                    {name: "John",
                    age: 40,
                    married: true}
                    ]
                };

console.log(persons);
console.log(persons.personas[0]);
console.log(persons.personas[1]);
console.log(persons.personas[2]);

const person = persons.personas[0];


/*const person = {
    name: "Bob",
    age: 30,
    married: false
};

/*const json = JSON.stringify(person);

console.log(json);  // {"name":"Bob","age":30}
/*
console.log(person); // { name: 'Bob', age: 30 }
console.log(person.name); // Bob
console.log(person.age);  // 30
console.log(person.married);  // false

let ageVariable = person.age;
ageVariable += 1;
console.log("Variable cambiada " + ageVariable);  // 31
person.age = ageVariable;
console.log(person);

person.children = ["Anna", "Billy"];
console.log(person);

console.log(person.patata);
/*

//document.getElementById("output").textContent = json;*/