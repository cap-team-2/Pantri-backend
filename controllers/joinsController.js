const express = require("express");
const joins = express.Router();
const { getAllData, getUserWholeOrder } = require("../queries/joins.js");

joins.get("/", async (req, res) => {
    const allData = await getAllData();
    if (allData[0]) {
        res.status(200).json(allData);
    } else {
        res.status(500).json({ error: error });
    };
});

joins.get("/:id", async (req, res) => {
    const {id} = req.params;
    const userData = await getUserWholeOrder();
    if (userData[0]) {
        res.status(200).json(userData);
    } else {
        res.status(404).json({ error: error });
    };
});

module.exports = joins;