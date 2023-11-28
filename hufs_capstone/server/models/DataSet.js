/*
CREATE TABLE `data_set` (
	`set_id` INT NOT NULL PRIMARY KEY,    -- 데이터 세트 ID
	`start_id` INT,                       -- 시작 ID
	`end_id` INT,                         -- 종료 ID
	`pet_id` INT,                         -- 반려동물 ID
);
*/
const DataSet = function (Sequelize, DataTypes) {
  const model = Sequelize.define(
    "data_set",
    {
      set_id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true,
      },
      start_id: {
        type: DataTypes.INTEGER,
        allowNull: false,
      },
      end_id: {
        type: DataTypes.INTEGER,
        allowNull: false,
      },
      pet_id: {
        type: DataTypes.INTEGER,
        allowNull: false,
      },
    },
    {
      timestamps: false,
      tableName: "data_set",
    }
  );
  return model;
};
module.exports = DataSet;
