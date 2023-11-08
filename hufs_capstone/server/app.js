// module
const express = require("express");
const path = require("path");
const mysql = require("mysql");
const bodyParser = require("body-parser");
const logger = require("morgan");

// app
const app = express();

// router
const apiRouter = require("./routes/api");

app.use(logger("dev"));
app.use(express.json());
var cors = require("cors");

app.use(cors());

const { Sequelize } = require("sequelize");
const sequelize = new Sequelize({
  database: "capstone",
  username: "root",
  password: "9698",
  host: "localhost",
  dialect: "mysql",
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

app.use(express.static(path.join(__dirname, "flutter_views")));

// port
const port = 8000;

// router setting
app.use("/api", apiRouter);

// unidentified routes
app.use((req, res, next) => {
  const error = new Error(`${req.method} ${req.url} 라우터가 없습니다.`);
  error.status = 404;
  next(error);
});

app.get("/", (req, res) =>
  res.sendFile(path.join(__dirname, "flutter_views", "main_page.html"))
);

app.listen(port, () =>
  console.log(`App listening at http://localhost:${port}`)
);
