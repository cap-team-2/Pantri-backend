const db = require("../db/dbConfig.js");

const getAllUsers = async () => {
    try {
        const allUsers = await db.any("SELECT * FROM users");
        return allUsers
    } catch (error) {
        return {error: error};
    };
};

const getUser = async (id) => {
    try {
        const user = await db.oneOrNone("SELECT * FROM users WHERE id=$1", id);
        return user;
    } catch (error) {
        return {error: error};
    };
};


const createUser = async () => {
    try {
        const newUser = await db.one(
            "INSERT INTO users(first_name, last_name, email, phone, address_1, address_2, city, zipcode, type) VALUES($1, $2, $3, $4, $5, $6, $7, $8, $9) RETURNING *",
            [users.first_name, users.last_name, users.email, users.phone, users.address_1, users.address_2, users.city, users.zipcode, users.type]
        );
        return newUser;
    } catch (error) {
        return {error: error};
    };
};

const updateUser = async (id) => {
    try {
        const updatedUser = await db.one(
            "UPDATE users SET first_name=$1, last_name=$2, email=$3, phone=$4, address_1=$5, address_2=$5, city=$6, zipcode=$7, type=$8"
            [users.first_name, users.last_name, users.email, users.phone, users.address_1, users.address_2, users.city, users.zipcode, users.type]
        );
        return updatedUser;
    } catch (error) {
        return {error: error};
    };
};

const deleteUser = async (id) => {
    try {
        const deletedUser = await db.one("DELETE FROM users WHERE id=$1 RETURNING *", [id]);
        return deletedUser;
    } catch (error) {
        return {error: error};
    };
};


module.exports = {
    getAllUsers,
    getUser,
    createUser,
    updateUser,
    deleteUser,
}