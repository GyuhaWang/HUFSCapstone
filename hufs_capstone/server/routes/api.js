const express = require("express");
const controller = require("../presenter/P_api");
const router = express.Router();

// http://localhost:8000/api/pet
// 반려동물 정보 저장
router.post("/pet", controller.pet);

// http://localhost:8000/api/upload
// CSV 파일 업로드
router.post("/upload", controller.upload);

// http://localhost:8000/api/monitoring
// 모니터링
router.get("/monitoring", controller.monitoring);

module.exports = router;
