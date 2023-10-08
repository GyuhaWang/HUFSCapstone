const express = require("express");
const app = express();
const port = 3000;

app.set("view engine", "dart");
app.set("views", __dirname + "/lib");
app.use(express.static(__dirname + "/lib"));

app.get("/", (req, res) => res.render("main"));

app.listen(port, () =>
  console.log(`Example app listening at http://localhost:${port}`)
);
