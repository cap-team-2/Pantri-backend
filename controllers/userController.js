const express = require("express");
const users = express.Router();
const { getAllUsers, getUser, createUser, updateUser, deleteUser} = require("../queries/user.js");

users.get("/", async (req, res) => {
    const allUsers = await getAllUsers();
    if (!allUsers.error) {
        res.status(200).json(allUser);
    } else {
        res.status(500).json({ error: "Server Error"});
    };
});

users.get("/:id", async (req, res) => {
    const {id} = req.params;
    const cart = await getUser(id);
    if (users) {
        res.status(200).json(user);
    } else {
        res.status(404).json({ error: "Not Found"})
    };
});

users.post("/", async (req, res) => {
    try {
        const user = await createUser(req.body);
        res.status(200).json(cart);
    } catch (error) {
        res.status(400).json({ error: error });
    };
});

users.put("/:id", async (req, res) => {
    const {id} = req.params;
    const updatedUser = updateUser(id, req.body);
    res.status(200).json(updatedUser);
});

users.delete("/:id", async (req, res) => {
    const {id} = req.params;
    const deletedUser = await deleteUser(id);
    if (deletedUser.id) {
        res.status(200).json(deletedUser);
    } else {
        res.status(404).json("User Was Not Found!");
    };
});

module.exports = users;