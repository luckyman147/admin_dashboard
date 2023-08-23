

module.exports=(sequelize,Datatype)=>{
    const SendEmail=sequelize.define('SendEmail',{
        email:{
            
            type:Datatype.STRING,
            allowNull:false,
        },
       
        SendSubject:{
            type:Datatype.STRING,
            allowNull:true,
        },
        SendEmailDescription:{
            type:Datatype.STRING(1000),
            allowNull:false,
          
            
            
            
        },
        Date:{
            type:Datatype.DATEONLY,
            allowNull:false,
            defaultValue: sequelize.literal('CURRENT_TIMESTAMP'),
        },
        
    })
    
    
    
    return SendEmail
}