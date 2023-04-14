// require('newrelic');
// require('dotenv').config();

const express = require("express");
const app = express();
const PORT = 3001 || process.env.PORT;
// const router = require("./routes.js");
const morgan = require("morgan");
const cors = require("cors");
const queries = require("./queries.js");

app.use(cors());
app.use(express.json());
app.use(express.urlencoded({extended: true}));;
// app.use(router);

app.listen(PORT, () => {
  console.log(`Server listening on port ${PORT}`)
})

app.get('/loaderio-2425d2acd7e50dd362d7c98448aa8df0', (req, res) => res.send('loaderio-2425d2acd7e50dd362d7c98448aa8df0'))

app.get("/products/:id", queries.getProduct);
app.get("/products/:id/styles", queries.getStyles);