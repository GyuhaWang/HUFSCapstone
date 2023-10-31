const { DataTypes } = require("sequelize");
const sequelize = require("../config/database"); // Import your Sequelize configuration

const PetInfo = sequelize.define("PetInfo", {
  pet_id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true,
  },
  name: DataTypes.STRING(20),
  birth: DataTypes.STRING(20),
  weight: DataTypes.STRING(20),
  type: DataTypes.STRING(20),
});

module.exports = PetInfo;
