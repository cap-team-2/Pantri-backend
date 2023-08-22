const db = require("../db/dbConfig.js");

const getAllUser = async () => {
    try {
        const allUser = await db.any("SELECT * FROM user");
        return allUser;
    } catch (error) {
        return { error: error };
    };
};

const getUser = async (id) => {
    try {
        const oneUser = await db.oneOrNone("SELECT * FROM user WHERE id=$1", id);
        return oneUser;
    } catch (error) {
        return { error: error };
    };
};

const createUser = async () => {
    try {
        const newUser = await db.one(
            "INSERT INTO user(first_name, last_name, user_email, user_phone, user_address_1, user_address_2, user_city, user_zipcode, User_type) VALUES($1, $2, $3, $4, $5, $6, $7, $8, $9) RETURNING *",
            [user.first_name, user.last_name, user.user_email, user.user_phone, user.user_address_1, user.user_address_2, user.user_city, user.user_zipcode, user.user_type]
        );
    } catch (error) {
        console.error(error);
    };
};

const updateUser = async (id) => {
    try {
        const updatedUser = await db.one(
            "UPDATE user SET first_name=$1, last_name=$2, user_email=$3, user_phone=$4, user_address_1=$5, user_address_2=$5, user_city=$6, user_zipcode=$7, user_type=$8"
            [user.first_name, user.last_name, user.user_email, user.user_phone, user.user_address_1, user.user_address_2, user.user_city, user.user_zipcode, user.user_type]
        );
    } catch (error) {
        console.error(error);
    };
};

const deleteUser = async (id) => {
    try {
        const deletedUser = await db.one("DELETE FROM user WHERE id=$1 REATURNING *", [id]);
        return deletedUser;
    } catch (error) {
        console.error(error);
    };
};

module.exports = {
    getAllUser,
    getUser,
    createUser,
    updateUser,
    deleteUser,
}