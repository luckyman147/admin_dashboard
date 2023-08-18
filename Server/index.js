const express=require('express')
const app=express()
const db=require('./models')
const userRoutes=require('./routes/user-routes')
const TransactionRoutes=require('./routes/Transaction-route')



app.use(express.urlencoded({extended:true}))
app.use(express.json())
app.use('/',userRoutes)
app.use('/',TransactionRoutes)

db.sequelize.sync().then(()=>{
    app.listen(3000,()=>{
        console.log('Server is running on port 3000')
    })
})