const db = require("../db/dbConfig.js");

const getAllSessions = async () => {
    try {
        const allSessions = await db.any("SELECT * FROM shopping_session");
        return allSessions;
    } catch (error) {
        return {error: error};
    };
};

const getSession = async (id) => {
    try {
        const session = await db.oneOrNone("SELECT * FROM shopping_session WHERE id=$1", id);
        return session;
    } catch (error) {
        return {error: error};
    };
};

const createSession = async (session) => {
    try {
        const newSession = await db.one( 
            "INSERT INTO shopping_session ( user_id, total, created_at) VALUES ($1, $2, $3) RETURNING *",
            [session.user_id, session.total, session.created_at]
        );
        return newSession;
    } catch (error) {
        return {error: error};
    };
};

const updateSession = async (id, session) => {
    try {
        const updatedSession = await db.one (
            "UPDATE shopping_session SET total=$1, created_at=$2 WHERE id=$3 RETURNING *",
            [ session.total, session.created_at, id]
        );
        return updatedSession;
    } catch (error) {
        return {error: error};
    };
};

const deleteSession = async (id) => {
    try {
        const deletedSession = await db.one("DELETE FROM shopping_session WHERE id=$1 RETURNING *", [id]);
        return deletedSession;
    } catch (error) {
        return {error: error};
    };
};

module.exports = {
    getAllSessions,
    getSession,
    createSession,
    updateSession,
    deleteSession
};