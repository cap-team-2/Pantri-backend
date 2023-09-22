const express = require("express");
const search = express.Router();

search.get("/*", (req, res) => {
  res.status(404);
});

module.exports = search;
