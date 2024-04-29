const express = require("express");
const cors = require("cors");
const app = express();
const userController = require("./controllers/usersController.js");
const sellersController = require("./controllers/sellersController.js");
const productsController = require("./controllers/productsController.js");
const ordersController = require("./controllers/ordersController.js");
const userOrdersController = require("./controllers/userOrdersController.js");
const sellerProductsController = require("./controllers/sellerProductsController.js");
const searchController = require("./controllers/searchController.js");
const shoppingSessionController = require("./controllers/shoppingSessionController.js");
const cartsController = require("./controllers/cartsController.js");
const stripe = require("./controllers/stripeConfig.js");
const { getProducts } = require("./queries/products.js");


app.use(cors());
app.use(express.json());

app.get("/", (req, res) => {
    res.send("Welcome to Pantri");
});




app.use("/config", stripe)
app.use("/search", searchController);
app.use("/users", userController);
app.use("/sellers", sellersController);
app.use("/products", productsController);
app.use("/orders", ordersController);
app.use("/user-orders", userOrdersController);
app.use("/seller-products", sellerProductsController);
app.use("/shopping-session", shoppingSessionController);
app.use("/carts", cartsController);

app.get("*", (req, res) => {
    res.status(404).json({error: "Not Found!"});
});

module.exports = app;
//deploy