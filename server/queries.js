// require('dotenv').config();
const Pool = require("pg").Pool;

// console.log(process.env.DB_NAME, 'db name');

const pool = new Pool({
  host: '54.226.13.233',
  user: 'postgres',
  database: 'postgres',
  password: 'postgres',
  port: 5432,
});

const getProduct = async (req, res) => {
  const id = parseInt(req.params.id);
  await pool.query("SELECT * FROM transformed_products WHERE id = $1", [id])
    .then( results => {
      res.status(200).json(results.rows)
    })
    .catch( error => {
      res.send(`error retrieving this product with id ${id}`);
    })
  // (error, results) => {
  //   if (error) {
  //     res.send(`error retrieving this product with id ${id}`);
  //   } else {
  //     res.status(200).json(results.rows)
  //   }
  // })
}

const getStyles = async (req, res) => {
  const id = parseInt(req.params.id);
  let result = {
    product_id: req.params.id
  }
  await pool.query('SELECT style_id, name, sale_price, original_price, "default?", photos, skus FROM transformed_styles WHERE product_id = $1', [id])
    .then(results => {
      result.results = results.rows;
      res.status(200).json(result);
    })
    .catch( error => {
      res.send(error, `error retrieving styles for product with id ${id}`);
    })
    // if (error) {
    //   res.send(error, `error retrieving styles for product with id ${id}`);
    // } else {
    //   result.results = results.rows;
    //   res.status(200).json(result);
    // }
  // });
}

module.exports = { getProduct, getStyles };