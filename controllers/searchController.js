const express = require("express");
const searchRouter = express.Router();
const { searchDatabase } = require("../queries/searchQuery");

searchRouter.get("/", async (req, res) => {
  try {
    const { search, filterBy, value } = req.query;
    const results = await searchDatabase({ search, filterBy, value });
    console.log(results);
    if (results.length) {
      res.status(200).json(results);
    } else {
      res.status(404).json({ error: "No Results Found" });
    }
  } catch (error) {
    console.error("Error while processing search request:", error);
    res.status(500).json({ error: "Internal Server Error" });
  }
   
});

module.exports = searchRouter;
