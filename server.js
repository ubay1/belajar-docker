const express = require("express");

const app = express();

app.get("/", (req, res) => {
  res.send("Hello world\n");
});

//Listen port
const PORT = 3000;
app.listen(PORT);
console.log(`Running on port ${PORT}`);
