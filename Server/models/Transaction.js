

module.exports=(sequelize,Datatype)=>{
    const Transaction=sequelize.define('Transaction',{
       
        Date:{
            type:Datatype.DATEONLY,
            allowNull:false,
            
        },

        Total:{
            type:Datatype.STRING,
            allowNull:false,
            
        },
        PaymentStatus:{
            type:Datatype.STRING,
            allowNull:false,
            values:['Paid',"Unpaid","Change Back"]
        },
       
    })
    

 Transaction.associate=models=>{
    Transaction.belongsTo(models.User,{
        onDelete:'cascade'
    })
 
 }
    return Transaction
}