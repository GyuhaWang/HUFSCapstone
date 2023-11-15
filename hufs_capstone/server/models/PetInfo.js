const { DataTypes } = require("sequelize");
const sequelize = require("../config/config");
/*
CREATE TABLE `pet_info` (
	`pet_id` INT NOT NULL PRIMARY KEY,    -- 반려동물 ID
	`name` CHAR(20),                      -- 이름
	`birth` DATE,                         -- 생년월일
	`weight` DECIMAL(5,2),                -- 무게
	`type` CHAR(20)                       -- 종류
);
*/
const PetInfo = sequelize.define("PetInfo", {
  pet_id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true,
  },
  name: DataTypes.STRING(20),
  birth: DataTypes.DATE,
  weight: DataTypes.DECIMAL(5, 2),
  type: DataTypes.STRING(20),
});

module.exports = PetInfo;
