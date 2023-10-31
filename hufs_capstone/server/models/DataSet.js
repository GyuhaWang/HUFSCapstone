const { DataTypes } = require("sequelize");
const sequelize = require("../config/database"); // Import your Sequelize configuration

const DataSet = sequelize.define("DataSet", {
  set_id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true,
  },
  start_id: DataTypes.INTEGER,
  end_id: DataTypes.INTEGER,
  pet_id: DataTypes.INTEGER,
});

module.exports = DataSet;
