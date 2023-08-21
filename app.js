const express = require("express");
const cors = require("cors");
const app = express();
const userController = require("./controllers/userController.js")
const productController = require("./controllers/productController.js")

app.use(express.json());
app.use(cors());

app.get("/", (req, res) => {
    res.send("Welcome to Search4");
});

app.use("/user", userController);
app.use("/product", productController)

app.get("*", (req, res) => {
    res.status(404).json({error: "Not Found"});
});

module.exports = app;