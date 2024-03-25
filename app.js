const express = require("express");
const cors = require("cors");
const app = express();
const userController = require("./controllers/usersController.js");
const sellersController = require("./controllers/sellersController.js");
const productsController = require("./controllers/productsController.js");
const ordersController = require("./controllers/ordersController.js");
const ordersProductsController = require("./controllers/ordersProductsController.js");
const userOrdersController = require("./controllers/userOrdersController.js");
const sellerProductsController = require("./controllers/sellerProductsController.js");
const joinsController = require("./controllers/joinsController.js");
const searchController = require("./controllers/searchController.js");
const shoppingSessionController = require("./controllers/shoppingSessionController.js");
const cartProductsController = require("./controllers/cartProductsController.js");
const cartJoinsController = require("./controllers/cartJoinsController.js");
const commentsController = require("./controllers/commentsController.js")
const stripe = require("./controllers/stripeConfig.js");
const { getProducts } = require("./queries/products.js");


app.use(cors());
app.use(express.json());

app.get("/", (req, res) => {
    res.send("Welcome to Pantri");
});

app.get("/products", async (req, res) => { 
    const { q, category, cost } = req.query;
    const products = await getProducts({ q, category, cost });
    res.status(200).json({products});
})


// app.use("/config", stripe)
// app.use("/search", searchController);
// app.use("/users", userController);
// app.use("/sellers", sellersController);
// app.use("/products", productsController);
// app.use("/orders", ordersController);
// app.use("/orders-products", ordersProductsController);
// app.use("/user-orders", userOrdersController);
// app.use("/seller-products", sellerProductsController);
// app.use("/joins", joinsController);
// app.use("/shopping-session", shoppingSessionController);
// app.use("/cart-products", cartProductsController);
// app.use("/cart-joins", cartJoinsController);
// app.use("/comments", commentsController);

app.get("*", (req, res) => {
    res.status(404).json({error: "Not Found!"});
});

module.exports = app;