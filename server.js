const express = require("express");

const app = express();

const BASE_URL = process.env.BASE_URL;
app.get("/", (req, res) => {
  res.send(`test env hmm = ${BASE_URL}`);
});

//Listen port
const PORT = 3000;
app.listen(PORT);
console.log(`Running on port ${PORT}`);
