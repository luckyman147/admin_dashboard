const express=require('express')
const route=express.Router()
const db=require('../models')
const bcrypt=require('bcrypt')
const UserController=require('../controllers/userController')
const jwt=require('jsonwebtoken')
route.post('/AddUser',(req,res,next)=>{
    UserController.register(req.body.Username,req.body.email,
        req.body.Phone,
        req.body.UserProfile,
        req.body.JoiningDate
        
        
        ).then(
        (response)=>res.status(200).send(response)
    ).catch((err)=> res.status(400).send(err))
    
})
// const Privatekey="This is private key hvbfiubeiubvbielaqdbfizuabfda,cnbbyrbfbrezbguierbgiuefb"
// route.post('/login',(req,res,next)=>{
    
//     UserController.login(req.body.email,req.body.password).then(
//         (token)=>res.status(200).send({token:token})
//     ).catch((err)=> res.status(400).send(err))

// })
route.get('/user/:id',(req,res,next)=>{
    db.User.findOne({where:{id:req.params.id}}).
    then((response)=>res.status(200).send(response)).
    catch((err)=> res.status(400).send(err))

})
route.get('/users',(req,res,next)=>{
    db.User.findAll().
    then((response)=>res.status(200).send(response)).
    catch((err)=> res.status(400).send(err))

})
route.patch('/user/:id',(req,res,next)=>{
    db.User.update({Username:req.body.Username,
        email:req.body.email,
        password:req.body.Phone,
        UserProfile:req.body.UserProfile,
        JoiningDate:req.body.JoiningDate
    
    },{where:{id:req.params.id}}).
        then((response)=>res.status(200).send(response)).
        catch((err)=> res.status(400).send(err))
})
route.delete('/user/:id',(req,res,next)=>{
    db.User.destroy({where:{id:req.params.id}}).
    then((response)=>res.status(200).send(response)).
    catch((err)=> res.status(400).send(err))

})
module.exports=route