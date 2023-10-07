const express = require("express");
const ratings = express.Router();
const { createRating, updateRating, deleteRating} = require("../queries/ratings.js");

ratings.post("/", async (req, res) => {
    try  {
        const newRating = await createRating(req.body);
        res.status(200).json(newRating);
    } catch (error) {
        res.status(400).json({ error: error });
    };
});

ratings.put("/:id", async (req, res) => {
    const {id} = req.params;
    const updatedRating = updateRating(id, req.body);
    res.status(200).json(updatedRating);
});

ratings.delete("/:id", async (req, res) => {
    const {id} = req.params;
    const deletedRating = await deleteRating(id);
    if (deletedRating.id) {
        res.status(200).json(deletedRating);
    } else {
        res.status(404).json("Rating Was Not Found!");
    };
});

module.exports = ratings;