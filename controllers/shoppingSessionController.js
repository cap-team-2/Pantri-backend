const express = require("express");
const session = express.Router();
const { getAllSessions, getSession, createSession, updateSession, deleteSession } = require("../queries/shoppingSession.js");

session.get("/", async (req, res) => {
    const allSessions = await getAllSessions();
    if (allSessions[0]) {
        res.status(200).json(allSessions)
    } else {
        res.status(500).json({ error: "Sever Error" })
    };
})

session.get("/:id", async (req, res) => {
    const {id} = req.params;
    const session = await getSession(id);
    if (session) {
        res.status(200).json(session);
    } else {
        res.status(404).json({ error: "User Not Found!"})
    };
});

session.post("/", async (req, res) => {
    try  {
        const newSession = await createSession(req.body);
        res.status(200).json(newSession);
    } catch (error) {
        res.status(400).json({ error: error });
    };
});

session.put("/:id", async (req, res) => {
    const {id} = req.params;
    const updatedSession = updateSession(id, req.body);
    res.status(200).json(updatedSession);
});

session.delete("/:id", async (req, res) => {
    const {id} = req.params;
    const deletedSession = await deleteSession(id);
    if (deletedSession.id) {
        res.status(200).json(deletedSession);
    } else {
        res.status(404).json("Session Was Not Found!");
    };
});

module.exports = session;