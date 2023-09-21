const express = require("express");
const sellers = express.Router();
const { getAllSellers, getSeller } = require("../queries/getSellers.js");

sellers.get("/", async (req, res) => {
    const sellers = await getAllSellers();
    if (sellers) {
        res.status(200).json(sellers);
    } else {
        res.status(404).json({ error: "Sever Error"});
    };
});

sellers.get("/sellers/:id", async (req, res) => {
    const { id } = req.params
    
    const sellers = await getSeller(id);
    if (sellers) {
        res.status(200).json(sellers);
    } else {
        res.status(404).json({ error: "Sever Error"});
    };
});

module.exports = sellers;