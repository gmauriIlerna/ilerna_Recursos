const express = require('express');
const app = express();
app.get('/', (req, res) => res.send('¡Hola desde Docker!'));
app.listen(3000);