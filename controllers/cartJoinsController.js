const express = require("express");
const cartJoins = express.Router();
const { joinProductsOnCartOnSessionID } = require("../queries/cartJoins.js");

cartJoins.get("/:sessionID", async (req, res) => {
    const { sessionID } = req.params;
    const cartJoins = await joinProductsOnCartOnSessionID(sessionID);
    if (cartJoins.error) {
        res.status(500).json({ error: error });
    } else if (cartJoins[0]) {
        res.status(200).json(cartJoins);
    } else {
        res.status(404).json('No Products in Cart')
    }
});

module.exports = cartJoins;