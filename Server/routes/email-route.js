const express=require('express')
const route=express.Router()
const db=require('../models')
const { Op } = require('sequelize');

// add route
route.post('/addEmail',(req,res,next)=>{
    const email={
        EmailUsername:req.body.EmailUsername,
        email:req.body.email,
        Subject:req.body.Subject,
        EmailDescription:req.body.EmailDescription,
        Date:req.body.Date
    }
    db.Email.create(email).
    then((response)=>res.status(200).send(response)).
    catch((err)=> res.status(400).send(err))
}
)
route.get('/Email/:id',(req,res,next)=>{
    db.Email.findOne({where:{id:req.params.id}}).
    then((response)=>res.status(200).send(response)).
    catch((err)=> res.status(400).send(err))

})

route.get('/Emails',(req,res,next)=>{
    db.Email.findAll().
    then((response)=>res.status(200).send(response)).
    catch((err)=> res.status(400).send(err))

})
route.patch('/Email/:id',(req,res,next)=>{
    db.Email.update({
        EmailUsername:req.body.EmailUsername,
        email:req.body.email,
        Subject:req.body.Subject,
        EmailDescription:req.body.EmailDescription,
        Date:req.body.Date
    },{where:{id:req.params.id}}).
        then((response)=>res.status(200).send(response)).
        catch((err)=> res.status(400).send(err))
})
route.delete('/Email/:id',(req,res,next)=>{
    db.Email.destroy({where:{id:req.params.id}}).
    then((response)=>res.sendStatus(204)).
    catch((err)=> res.status(400).send(err))

})
module.exports=route