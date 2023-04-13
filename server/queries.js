// require('dotenv').config();
const Pool = require("pg").Pool;

// console.log(process.env.DB_NAME, 'db name');

const pool = new Pool({
  database: 'mydb',
  password: 'root',
  port: 5432,
});

const getProduct = (req, res) => {
  const id = parseInt(req.params.id);
  pool.query("SELECT * FROM transformed_products WHERE id = $1", [id], (error, results) => {
    if (error) {
      res.send(`error retrieving this product with id ${id}`);
    }
    res.status(200).json(results.rows)
  })
}

const getStyles = (req, res) => {
  const id = parseInt(req.params.id);
  let result = {
    product_id: req.params.id
  }
  pool.query('SELECT style_id, name, sale_price, original_price, "default?", photos, skus FROM transformed_styles WHERE product_id = $1', [id], (error, results) => {
    if (error) {
      res.send(`error retrieving styles for product with id ${id}`);
    }
    result.results = results.rows;
    res.status(200).json(result);
  });
}

module.exports = { getProduct, getStyles };