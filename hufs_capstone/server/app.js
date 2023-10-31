const express = require("express");
const path = require("path");
const mysql = require("mysql");
const bodyParser = require("body-parser");
const logger = require("morgan");

const app = express();
const port = 8000;

app.use(logger("dev"));
app.use(express.json());
var cors = require("cors");

app.use(cors());

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(express.static(path.join(__dirname, "flutter_views")));

app.set("views", path.join(__dirname, "flutter_views"));
app.set("view engine", "ejs");

app.get("/", (req, res) => res.render("main"));

app.listen(port, () =>
  console.log(`App listening at http://localhost:${port}`)
);
