const { DataTypes } = require("sequelize");
const sequelize = require("../config/database"); // Import your Sequelize configuration

const AccelerationData = sequelize.define("AccelerationData", {
  id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true,
  },
  x: DataTypes.INTEGER,
  y: DataTypes.INTEGER,
  z: DataTypes.INTEGER,
  create_date: DataTypes.INTEGER,
  device_id: DataTypes.INTEGER,
  pet_id: DataTypes.INTEGER,
  user_id: DataTypes.STRING(20),
});

module.exports = AccelerationData;
