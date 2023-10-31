const express = require("express");
const router = express.Router();
const { PetInfo } = require("../models"); // Import the PetInfo model

// API 기능설명
// 'flutter_views'의 'pet_info_input_page.dart' 페이지에서 input된 pet 정보 POST
router.post("/storePetInfo", async (req, res) => {
  try {
    // req.body에 pet_info 넣기
    const { name, weight, birth, type } = req.body;

    // pet_info entry DB에 만들기
    const petInfo = await PetInfo.create({
      name,
      weight,
      birth,
      type,
    });

    // 성공메세지와 함께 pet_info 반환
    res.status(201).json({ message: "반려동물 정보 저장 성공", petInfo });
  } catch (error) {
    console.error(error);
    res
      .status(500)
      .json({ message: "ERROR: 반려동물의 정보를 저장하지 못했습니다." });
  }
});

module.exports = router;
