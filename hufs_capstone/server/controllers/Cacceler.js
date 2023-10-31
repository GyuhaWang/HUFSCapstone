const express = require("express");
const router = express.Router();
const { AccelerationData } = require("../models"); // Import the AccelerationData model

// API 기능설명
// 'flutter_views' 폴더의 'main_page.dart' 페이지에서 전송받은 .csv 폴더를 DB에 POST
router.post("/upload", async (req, res) => {
  try {
    // request body에서 .csv data 추출
    const { x, y, z, create_date, device_id, pet_id, user_id } = req.body;

    const accelerationData = await AccelerationData.create({
      x,
      y,
      z,
      create_date,
      device_id,
      pet_id,
      user_id,
    });

    // 성공메세지와 함께 acceleration_data 반환
    res.status(201).json({
      message: "업로드 성공",
      accelerationData,
    });
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: "가속정보 저장에 실패하였습니다." });
  }
});

module.exports = router;
