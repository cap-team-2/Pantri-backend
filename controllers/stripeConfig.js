const express = require("express");
const stripe = require('stripe')(process.env.STRIPE_SECRECT_KEY); 
const app = express();

app.get("/", (req, res) => {
    res.send({
        publishableKey:  process.env.STRIPE_PUBLISHABLE_KEY,
    })
})

app.post("/create-payment-intent", async (req, res) => {
    try {
        const paymentIntent = await stripe.paymentIntents.create({
            currency: "usd",
            amount: 1999,
            payment_method_types: ['card'], 
            setup_future_usage: 'on_session',
        });
    
        res.send(200).json({ clientSecret: paymentIntent.client_secret });
    } catch (error) {
        console.error('Error creating payment intent:', error);
        res.status(500).json({ error: 'An error occurred while creating the payment intent' });
}
});

module.exports = app;



