/*
CREATE TABLE `pet_info` (
	`pet_id` INT NOT NULL PRIMARY KEY,    -- 반려동물 ID
	`name` CHAR(20),                      -- 이름
	`birth` DATE,                         -- 생년월일
	`weight` DECIMAL(5,2),                -- 무게
	`type` CHAR(20)                       -- 종류
);
*/
const PetInfo = function (Sequelize, DataTypes) {
  const model = Sequelize.define(
    "pet_info",
    {
      pet_id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true,
      },
      name: {
        type: DataTypes.STRING,
        allowNull: false,
      },
      weight: {
        type: DataTypes.INTEGER,
        allowNull: true,
      },
      birth: {
        type: DataTypes.DATE,
        allowNull: true,
      },
      type: {
        type: DataTypes.STRING,
        allowNull: true,
      },
    },
    {
      timestamps: false,
    }
  );
  return model;
};
module.exports = PetInfo;
