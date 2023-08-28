const express = require("express");
const cors = require("cors");
const app = express();
const userController = require("./controllers/userController.js");
const productController = require("./controllers/productController.js");
const orderController = require("./controllers/orderController.js");
const userOrderController = require("./controllers/userOrderController.js");

app.use(express.json());
app.use(cors());

app.get("/", (req, res) => {
    res.send("Welcome to Pantri");
});

app.use("/users", userController);
app.use("/products", productController);
app.use("/orders", orderController);
app.user("/userOrder", userOrderController);

app.get("*", (req, res) => {
    res.status(404).json({error: "Not Found"});
});

module.exports = app;