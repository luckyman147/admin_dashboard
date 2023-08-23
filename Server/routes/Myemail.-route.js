const express=require('express')
const route=express.Router()
const db=require('../models')
const { Op } = require('sequelize');

route.post('/addSendEmail',(req,res,next)=>{
    db.SendEmail.create({
        email: req.body.email,
        SendSubject:req.body.SendSubject,
        SendEmailDescription:req.body.SendEmailDescription,
        Date:req.body.Date,
        
        }).
        then((response)=>res.status(200).send(response)).
        catch((err)=> res.status(400).send(err))
})
route.get('/SendEmail/:id',(req,res,next)=>{
    db.SendEmail.findOne({where:{id:req.params.id},include:[db.Email.EmailUsername,db.Email.email]}).
    then((response)=>res.status(200).send(response)).
    catch((err)=> res.status(400).send(err))

})

route.get('/SendEmails',(req,res,next)=>{
    db.SendEmail.findAll().
    then((response)=>res.status(200).send(response)).
    catch((err)=> res.status(400).send(err))

})
route.patch('/SendEmail/:id',(req,res,next)=>{
    db.SendEmail.update({
        email:req.body.email,
        SendSubject:req.body.SendSubject,
        SendEmailDescription:req.body.SendEmailDescription,
        Date:req.body.Date,
        
        },{where:{id:req.params.id}}).
        then((response)=>res.status(200).send(response)).
        catch((err)=> res.status(400).send(err))
})
route.delete('/SendEmail/:id',(req,res,next)=>{
    db.SendEmail.destroy({where:{id:req.params.id}}).
    then((response)=>res.sendStatus(204)).
    catch((err)=> res.status(400).send(err))

})
module.exports=route