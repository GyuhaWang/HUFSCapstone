const { PetInfo, AccelerationData } = require("../models");
const csv = require("fast-csv");

const controller = {
  // Controller to store pet information
  pet: async (req, res) => {
    try {
      // Extract pet information from the request body
      const { name, weight, birth, type } = req.body;
      print(req.body);

      // Create a new pet info record in the database
      models.PetInfo.create({
        name,
        weight,
        birth,
        type,
      });
      // Send a success response
      res.status(201).json({ message: "반려동물 저장 성공", data: newPet });
    } catch (error) {
      // Handle errors and send an error response
      console.error("Error saving pet information:", error);
      res.status(500).json({ error: "반려동물의 정보를 저장하지 못했습니다." });
    }
  },

  // Controller to handle CSV file upload
  upload: async (req, res) => {
    try {
      // Check if a file is included in the request
      if (!req.file) {
        return res.status(400).json({ error: "CSV 파일이 없습니다." });
      }

      // Process the CSV data and save it in the database
      const csvData = req.file.buffer.toString(); // Assuming 'req.file' contains the CSV file data
      const rows = [];
      csv
        .parseString(csvData)
        .on("data", (row) => {
          rows.push(row);
        })
        .on("end", async () => {
          await AccelerationData.bulkCreate(rows);
          res.status(201).json({ message: "CSV 업로드 & DB 저장 성공" });
        });
    } catch (error) {
      // Handle errors and send an error response
      console.error("Error uploading and processing CSV file:", error);
      res.status(500).json({ error: "CSV 파일을 저장하지 못했습니다." });
    }
  },
};

module.exports = controller;
