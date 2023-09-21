const express = require("express");
const search = express.Router();
// const { getAllProducts } = require("../queries/products.js")
const { getAllProductsWithMatchingName } = require("../queries/products");

// **Change key to query; data to searchResults
search.get("/:key", async (req, res) => {
  const { key } = req.params;

  // send query with search term
  const productsBySearchTerm = await getAllProductsWithMatchingName(key);

  // const products = await getAllProducts();
  // const lowerCaseKey = key.toLowerCase();
  // const filteredProducts = products.filter((product) => {
  //     const productName = product.name.split(' ');
  //     const productNameArr = productName.map((ele) => {
  //         return ele.toLowerCase()
  //     })

  //     return productNameArr.some((name) => name.includes(lowerCaseKey) || lowerCaseKey.includes(name));

  //     // return productName.toLowerCase().includes(key);
  // })

  // res.send(filteredProducts);
  res.send(productsBySearchTerm);
});

search.get("/*", (req, res) => {
  res.status(404);
});

module.exports = search;
