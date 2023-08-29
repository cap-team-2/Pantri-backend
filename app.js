const express = require("express");
const cors = require("cors");
const app = express();
const userController = require("./controllers/usersController.js");
const productController = require("./controllers/productsController.js");
const orderController = require("./controllers/ordersController.js");
const ordersProductsController = require("./controllers/ordersProductsController.js")
const userOrderController = require("./controllers/userOrdersController.js");
const sellerProductController = require("./controllers/sellerProductsController.js");
const joinsController = require("./controllers/joinsController.js");

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
app.use("/seller-product", sellerProductController);
app.use("/joins", joinsController);

app.get("*", (req, res) => {
    res.status(404).json({error: "Not Found"});
});

module.exports = app;