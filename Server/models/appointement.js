module.exports = (sequelize, DataTypes) => {
    const Appointment = sequelize.define('Appointment', {
      startTime: {
        type: DataTypes.DATE,
        allowNull: false,
      },
      endTime: {
        type: DataTypes.DATE,
        allowNull: false,
      },
      subject: {
        type: DataTypes.STRING,
        allowNull: false,
      },
      color: {
        type: DataTypes.STRING,
        allowNull: true,
      },
        isAllDay: {
        type: DataTypes.BOOLEAN,
        allowNull: false,
        defaultValue: false,
        },
        
    });
  
    return Appointment;
  };