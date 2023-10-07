const express = require("express");
const comments = express.Router();
const { createComment, updateComment, deleteComment} = require("../queries/comments.js");

comments.post("/", async (req, res) => {
    try  {
        const newComment = await createComment(req.body);
        res.status(200).json(newComment);
    } catch (error) {
        res.status(400).json({ error: error });
    };
});

comments.put("/:id", async (req, res) => {
    const {id} = req.params;
    const updatedComment = updateComment(id, req.body);
    res.status(200).json(updatedComment);
});

comments.delete("/:id", async (req, res) => {
    const {id} = req.params;
    const deletedComment = await deleteComment(id);
    if (deletedComment.id) {
        res.status(200).json(deletedComment);
    } else {
        res.status(404).json("comment Was Not Found!");
    };
});

module.exports = comments;