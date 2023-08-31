module.exports=(sequelize,Datatype)=>{
    const Complaints=sequelize.define('Complaints',{

       
        Subject:{
            type:Datatype.STRING,
            allowNull:true,
        },
        contenu:{
            type:Datatype.STRING(1000),
            allowNull:false,
        },
        Date:{
            type:Datatype.DATEONLY,
            allowNull:false,
            defaultValue: sequelize.literal('CURRENT_TIMESTAMP'),
        },

    })
 Complaints.associate=models=>{
    Complaints.belongsTo(models.User,{
        onDelete:'cascade'
    })
  
 }
    return Complaints
}