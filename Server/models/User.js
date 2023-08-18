module.exports=(sequelize,Datatype)=>{
    const User=sequelize.define('User',{
        Username:{
            type:Datatype.STRING,
            allowNull:false
        },
        email:{
            type:Datatype.STRING,
            allowNull:false,
            unique:true
        },
        Phone:{
            type:Datatype.STRING,
            allowNull:false,
        },
        UserProfile:{
            type:Datatype.STRING,
            allowNull:false,
          
            values:['B2B',"B2C"]
            
            
        },

        JoiningDate:{
            type:Datatype.DATEONLY,
            allowNull:false,
            
        }
    })
 User.associate=models=>{
    User.hasMany(models.Transaction,{
        onDelete:'cascade'
    })
  
 }
    return User
}