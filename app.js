const express = require("express");
const cors = require("cors");
const app = express();
const userController = require("./controllers/usersController.js");
const productsController = require("./controllers/productsController.js");
const ordersController = require("./controllers/ordersController.js");
const ordersProductsController = require("./controllers/ordersProductsController.js")
const userOrdersController = require("./controllers/userOrdersController.js");
const sellerProductsController = require("./controllers/sellerProductsController.js");
const joinsController = require("./controllers/joinsController.js");

app.use(cors());
app.use(express.json());


app.get("/", (req, res) => {
    res.send("Welcome to Pantri");
});

app.use("/users", userController);
app.use("/products", productsController);
app.use("/orders", ordersController);
app.use("/orders-products", ordersProductsController);
app.use("/user-orders", userOrdersController);
app.use("/seller-products", sellerProductsController);
app.use("/joins", joinsController);

app.get("*", (req, res) => {
    res.status(404).json({error: "Not Found"});
});

module.exports = app;