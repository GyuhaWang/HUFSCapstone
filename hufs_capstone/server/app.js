const express = require("express");
const path = require("path");
const mysql = require("mysql");
const bodyParser = require("body-parser");

const app = express();
const port = 8000;

app.use(express.json());
var cors = require("cors");

app.use(cors());

app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

app.set("view engine", "dart");
app.set("views", __dirname + "/lib");
app.use(express.static(__dirname + "/lib"));

app.get("/", (req, res) => res.render("main"));

app.listen(port, () =>
  console.log(`App listening at http://localhost:${port}`)
);
