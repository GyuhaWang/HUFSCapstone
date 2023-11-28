const model = require("../models/index");
const csv = require("fast-csv");
const tf = require("@tensorflow/tfjs-node");

const controller = {
  // Controller to store pet information
  pet: async (req, res) => {
    // Extract pet information from the request body
    const { name, weight, birth, type } = req.body;

    // Create a new pet info record in the database build by 'Sequalize'
    model.PetInfo.create({
      name,
      weight,
      birth,
      type,
    })
      .then((res) => {
        // Send a success response
        res.status(201).json({ message: "반려동물 정보 저장 성공" });
      })
      .catch((error) => {
        // Handle errors and send an error response
        console.error(error);
        res
          .status(500)
          .json({ error: "반려동물의 정보를 저장하지 못했습니다." });
      });
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

  // Parses group data from the database, processes it using 1D-CNN-Model and returns the result to the client
  monitoring: async (req, res) => {
    try {
      // Extract pet information from the request body
      const { setId } = req.body;

      // Get the set_id from the request body and find the set from 'data_set' table
      const set = await DataSet.findOne({ where: { set_id: setId } });

      // Extract start_id and end_id from it
      const { start_id, end_id } = set;

      // Pass the data from start_id to end_id in 'acceleration_data' table to the 1D-CNN-Model (best.h5)
      const accelerationData = await AccelerationData.findAll({
        where: {
          id: {
            [Op.between]: [start_id, end_id],
          },
        },
      });

      const model = await tf.loadLayersModel("../tf_model/best.h5");

      // Process the acceleration data using the 1D-CNN-Model
      const result = await processAccelerationData(accelerationData);

      // Send the result to the client
      res.status(200).json({ message: "모니터링 성공", data: result });
    } catch (error) {
      // Handle errors and send an error response
      console.error("Error monitoring the pet:", error);
      res.status(500).json({ error: "반려동물을 모니터링하지 못했습니다." });
    }
  },
};

module.exports = controller;
