const Pool = require("pg").Pool;
const pool = new Pool({
  database: "mydb",
  password: "root",
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
  // pool.query("SELECT * FROM transformed_products WHERE id = $1", [id], (error, results) => {
  //   if (error) {
  //     res.send(`error retrieving this product with id ${id}`);
  //   }
  //   res.status(200).json(results.rows)
  // })
  res.status(200).send(`get styles request received for prod id ${id}`);
}

module.exports = { getProduct, getStyles };