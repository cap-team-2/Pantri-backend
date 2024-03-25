const app = require("./app.js");

console.log(process.env.DATABASE_URL)
const PORT = process.env.PORT || 3000;

app.listen((PORT), () => {
    console.log(`listening to port ${PORT}`)
});