const express = require("express");
const router = express.Router();
const { Sequelize, DataTypes } = require("sequelize");
const multer = require("multer");
const csv = require("csv-parser");
const fs = require("fs");

const AccelerationData = require("../models/accelerationData");
const PetInfo = require("../models/petInfo");

// multer: handle file uploads
const storage = multer.memoryStorage(); // Store the file in memory
const upload = multer({ storage: storage });

// http://localhost:8080/api/pet
// 반려동물 정보 저장
router.post("/pet", async (req, res) => {
  try {
    const { name, weight, birth, type } = req.body;

    // Create a new pet info entry in your database (assuming you have a Sequelize model)
    // Replace this with your actual model
    const newPet = await PetInfo.create({
      name,
      weight,
      birth,
      type,
    });

    // If the creation is successful, you can send a success response
    res.status(201).json(newPet);
    res.status(201).json({ message: "Pet information saved successfully" });
  } catch (error) {
    console.error("Error saving pet information:", error);
    res.status(500).json({ message: "Failed to save pet information" });
  }
});

// http://localhost:8080/api/upload
// CSV 파일 업로드
router.post("/upload", upload.single("csvFile"), async (req, res) => {
  try {
    // Check if a CSV file was uploaded
    if (!req.file) {
      return res.status(400).json({ message: "No CSV file uploaded" });
    }

    // Parse the uploaded CSV file
    const csvFileBuffer = req.file.buffer;
    const results = [];

    fs.writeFileSync("temp.csv", csvFileBuffer);

    fs.createReadStream("temp.csv")
      .pipe(csv())
      .on("data", (row) => {
        // Process each row in the CSV file
        // Replace these with your expected data fields
        const { x, y, z, create_date, device_id, pet_id, user_id } = row;

        // Create a new entry in your acceleration_data table
        // Replace this with the actual model and table name
        // const newAccelerationData = await AccelerationData.create({
        //   x,
        //   y,
        //   z,
        //   create_date,
        //   device_id,
        //   pet_id,
        //   user_id,
        // });

        // results.push(newAccelerationData);
        results.push({ message: "CSV data saved successfully" });
      })
      .on("end", () => {
        fs.unlinkSync("temp.csv"); // Delete the temporary file
        res.status(201).json(results);
      });
  } catch (error) {
    console.error("Error saving CSV data:", error);
    res.status(500).json({ message: "Failed to save CSV data" });
  }
});

module.exports = router;
