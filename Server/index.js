const express=require('express')
const app=express()
const db=require('./models')
const userRoutes=require('./routes/user-routes')
const TransactionRoutes=require('./routes/Transaction-route')
const ReceiveEmailRoutes=require('./routes/email-route')
const Myemail=require('./routes/Myemail.-route')
const appoitement =require('./routes/appoitement-route')


app.use(express.urlencoded({extended:true}))
app.use(express.json())
app.use('/',userRoutes)
app.use('/',TransactionRoutes)
app.use('/',ReceiveEmailRoutes)
app.use('/',Myemail)
app.use('/',appoitement)

db.sequelize.sync().then(()=>{
    app.listen(3000,()=>{
        console.log('Server is running on port 3000')
    })
})