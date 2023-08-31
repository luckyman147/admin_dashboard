const express=require('express')
const route=express.Router()
const db=require('../models')
const { Op } = require('sequelize');

route.post('/addComplaints',(req,res,next)=>{
    db.Complaints.create({Date:req.body.Date,
        contenu:req.body.contenu,
        Subject:req.body.Subject,
        UserId:req.body.UserId
        }).
        then((response)=>res.status(200).send(response)).
        catch((err)=> res.status(400).send(err))
})
route.get('/Complaints/:id',(req,res,next)=>{
    db.Complaints.findOne({where:{id:req.params.id},include:[db.User.Username,db.User.email]}).
    then((response)=>res.status(200).send(response)).
    catch((err)=> res.status(400).send(err))

})

route.get('/Complaints',(req,res,next)=>{
    db.Complaints.findAll({include:[    {
        model: db.User,
        attributes: ['id','Username', 'email'] // Include only specific attributes
      }]}).
    then((response)=>res.status(200).send(response)).
    catch((err)=> res.status(400).send(err))

})
route.patch('/Complaints/:id',(req,res,next)=>{
    db.Complaints.update({
        Date:req.body.Date,
        contenu:req.body.contenu,
        Subject:req.body.Subject,
        UserId:req.body.UserId
    },{where:{id:req.params.id}}).
        then((response)=>res.status(200).send(response)).
        catch((err)=> res.status(400).send(err))
})
route.delete('/Complaints/:id',(req,res,next)=>{
    db.Complaints.destroy({where:{id:req.params.id}}).
    then((response)=>res.sendStatus(204)).
    catch((err)=> res.status(400).send(err))

})
module.exports=route