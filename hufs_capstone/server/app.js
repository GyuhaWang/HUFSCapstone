// module
const express = require("express");
const path = require("path");
const mysql = require("mysql");
const bodyParser = require("body-parser");
const logger = require("morgan");

// app
const app = express();

// router
const { Sequelize } = require("./models/index");
const indexRouter = require("./routes/index");
const petRouter = require("./routes/pet");
const accelRouter = require("./routes/accel");

app.use(logger("dev"));
app.use(express.json());
var cors = require("cors");

app.use(cors());

const { Sequelize } = require("sequelize");
const sequelize = new Sequelize("database", "username", "password", {
  host: "localhost",
  dialect: "mysql", // Or the database dialect you are using
});

// Test the database connection
sequelize
  .sync({ force: false })
  .authenticate()
  .then(() => {
    console.log("Database 연결 성공");
  })
  .catch((err) => {
    console.error("Unable to connect to the database:", err);
  });

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(express.static(path.join(__dirname, "public")));

app.set("views", path.join(__dirname, "flutter_views"));
app.set("view engine", "ejs");

// port
const port = 8000;

// router setting
app.use("/", indexRouter);
app.use("/pet", petRouter);
app.use("/upload", accelRouter);
app.use("/resulte", resulteRouter);

// unidentified routes
app.use((req, res, next) => {
  const error = new Error(`${req.method} ${req.url} 라우터가 없습니다.`);
  error.status = 404;
  next(error);
});

app.listen(port, () =>
  console.log(`App listening at http://localhost:${port}`)
);
