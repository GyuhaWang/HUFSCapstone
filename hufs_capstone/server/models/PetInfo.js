/*
CREATE TABLE `pet_info` (
	`pet_id` INT NOT NULL PRIMARY KEY,    -- 반려동물 ID
	`name` CHAR(20),                      -- 이름
	`birth` INT,                         -- 생년월일
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
        allowNull: false,
        primaryKey: true,
        autoIncrement: true,
      },
      name: {
        type: DataTypes.STRING(20),
        allowNull: true,
      },
      weight: {
        type: DataTypes.DECIMAL(5, 2),
        allowNull: true,
      },
      birth: {
        type: DataTypes.INTEGER,
        allowNull: true,
      },
      type: {
        type: DataTypes.STRING(20),
        allowNull: true,
      },
    },
    {
      timestamps: false,
      tableName: "pet_info",
    }
  );
  return model;
};
module.exports = PetInfo;
