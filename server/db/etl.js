const fs = require("fs");
const { parse } = require("csv-parse");
const path = require("path");

const productsCSV = path.join(__dirname, "../../data/products.csv");
const skusCSV = path.join(__dirname, "../../data/skus.csv");
const stylesCSV = path.join(__dirname, "../../data/styles.csv");

const productsData = [];

fs.createReadStream(productsCSV)
  .pipe(parse({
    delimiter: ",",
    columns: true,
  }))
  .on("data", data => {
    productsData.push(data);
  })
  .on("error", err => {
    console.log(err.message);
  })
  .on('end', () => {
    console.log(productsData);
  });