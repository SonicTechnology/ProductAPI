const fs = require("fs");
const { parse } = require("csv-parse");
const path = require("path");

const productsCSV = path.join(__dirname, "../../data/products.csv");
const featuresCSV = path.join(__dirname, "../../data/features.csv");
const skusCSV = path.join(__dirname, "../../data/skus.csv");
const stylesCSV = path.join(__dirname, "../../data/styles.csv");
const photosCSV = path.join(__dirname, "../../data/photos.csv");

const productsData = [];
const featuresCSV = [];

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