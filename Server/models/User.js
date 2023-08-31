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
        password:{
            type:Datatype.STRING,
            allowNull:false,
            
        },

        JoiningDate:{
            type:Datatype.DATEONLY,
            
            defaultValue: sequelize.literal('CURRENT_TIMESTAMP'),

            
        },
        BirthDate:{
            type:Datatype.DATEONLY,
            allowNull:false,
            
        },
        userImage: {
            type: Datatype.BLOB,
            allowNull: true,
          },
        Genre:{
            type:Datatype.STRING,
            allowNull:false,

        },
        Sex:{
            type:Datatype.STRING,
            allowNull:false,
            values:['Male,Female,other']

        },
        Adress:{
            type:Datatype.STRING,
            allowNull:true,


        }

    })
 User.associate=models=>{
    User.hasMany(models.Transaction,{
        onDelete:'cascade'
    }),
    User.hasMany(models.Complaints,{
        onDelete:'cascade'
    })
  
 }
    return User
}