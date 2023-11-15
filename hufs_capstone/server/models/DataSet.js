/*
CREATE TABLE `data_set` (
	`set_id` INT NOT NULL PRIMARY KEY,    -- 데이터 세트 ID
	`start_id` INT,                       -- 시작 ID
	`end_id` INT,                         -- 종료 ID
	`pet_id` INT,                         -- 반려동물 ID
);
*/
const DataSet = function (Sequelize, DataTypes) {
  const model = Sequelize.define("data_set", {
    set_id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
    },
    start_id: DataTypes.INTEGER,
    end_id: DataTypes.INTEGER,
    pet_id: DataTypes.INTEGER,
  });
  return model;
};
module.exports = DataSet;
