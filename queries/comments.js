const db = require("../db/dbConfig.js");

const createComment = async (comment) => {
    try {
        const newComment = await db.one(
            "INSERT INTO comments(comment) VALUES($1) RETURNING *",
            [comment.comment]
        );
        return newComment;
    } catch (error) {
        return {error: error};
    };
};

const updateComment = async (id, comment) => {
    try {
        const updatedComment = await db.one(
            "UPDATE comments SET first_name=$1"
            [comment.comment, id]
        );
        return updatedComment;
    } catch (error) {
        return {error: error};
    };
};

const deleteComment = async (id) => {
    try {
        const deletedComment = await db.one("DELETE FROM comments WHERE id=$1 RETURNING *", [id]);
        return deletedComment;
    } catch (error) {
        return {error: error};
    };
};


module.exports = {
    createComment,
    updateComment,
    deleteComment,
}