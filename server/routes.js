const router = require("express").Router();
const queries = require("./queries.js");

router.get("/products/:id/styles", queries.getStyles);
router.get("/products", queries.getProduct);

module.exports = router;