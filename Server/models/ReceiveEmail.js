module.exports=(sequelize,Datatype)=>{
    const Email=sequelize.define('Email',{
        EmailUsername:{
            type:Datatype.STRING,
            allowNull:false
        },
        email:{
            type:Datatype.STRING,
            allowNull:false,
            unique:true
        },
        Subject:{
            type:Datatype.STRING,
            allowNull:true,
        },
        EmailDescription:{
            type:Datatype.STRING(1000),
            allowNull:false,
        
            
            
        },

        Date:{
            type:Datatype.DATEONLY,
            allowNull:false,
            
        }
    })
 
    return Email
}