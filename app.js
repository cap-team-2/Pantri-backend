const express = require("express");
const cors = require("cors");
const app = express();
const userController = require("./controllers/usersController.js");
const productController = require("./controllers/productsController.js");
const orderController = require("./controllers/ordersController.js");
const ordersProductsController = require("./controllers/ordersProductsController.js")
const userOrderController = require("./controllers/userOrdersController.js");

app.use(cors());
app.use(express.json());


app.get("/", (req, res) => {
    res.send("Welcome to Pantri");
});

app.use("/users", userController);
app.use("/products", productController);
app.use("/orders", orderController);
app.use("/orders-products", ordersProductsController);
app.use("/user-order", userOrderController);

app.get("*", (req, res) => {
    res.status(404).json({error: "Not Found"});
});

module.exports = app;