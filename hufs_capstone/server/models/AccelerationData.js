const { DataTypes } = require("sequelize");
const sequelize = require("../config/database"); // Import your Sequelize configuration

/* 
CREATE TABLE `acceleration_data` (
	`id` INT NOT NULL PRIMARY KEY,        -- 고유 ID
	`x` INT,                              -- x 좌표
	`y` INT,                              -- y 좌표
	`z` INT,                              -- z 좌표
	`create_date` DATETIME,               -- 생성 날짜 및 시간
	`device_id` INT,                      -- 디바이스 ID
	`pet_id` INT,                         -- 반려동물 ID
	`user_id` INT,                        -- 사용자 ID
);
*/

const AccelerationData = sequelize.define("AccelerationData", {
  id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true,
  },
  x: DataTypes.INTEGER,
  y: DataTypes.INTEGER,
  z: DataTypes.INTEGER,
  create_date: DataTypes.DATE,
  device_id: DataTypes.INTEGER,
  pet_id: DataTypes.INTEGER,
  user_id: DataTypes.INTEGER,
});

module.exports = AccelerationData;
