const db = require("../db/dbConfig.js");

const createRating = async (rating) => {
    try {
        const newRating = await db.one(
            "INSERT INTO ratings(rating) VALUES($1) RETURNING *",
            [rating.rating]
        );
        return newRating;
    } catch (error) {
        return {error: error};
    };
};

const updateRating = async (id, ratings) => {
    try {
        const updatedRating = await db.one(
            "UPDATE ratings SET rating=$1"
            [ratings.rating, id]
        );
        return updatedRating;
    } catch (error) {
        return {error: error};
    };
};

const deleteRating = async (id) => {
    try {
        const deletedRating = await db.one("DELETE FROM ratings WHERE id=$1 RETURNING *", [id]);
        return deletedRating;
    } catch (error) {
        return {error: error};
    };
};


module.exports = {
    createRating,
    updateRating,
    deleteRating,
}