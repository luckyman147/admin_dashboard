const express=require('express')
const route=express.Router()
const db=require('../models')
const { Op } = require('sequelize');

route.post('/addTransaction',(req,res,next)=>{
    db.Transaction.create({Date:req.body.Date,
        Total:req.body.Total,
        PaymentStatus:req.body.PaymentStatus,
        UserId:req.body.UserId
        }).
        then((response)=>res.status(200).send(response)).
        catch((err)=> res.status(400).send(err))
})
route.get('/transaction/:id',(req,res,next)=>{
    db.Transaction.findOne({where:{id:req.params.id},include:[db.User.Username,db.User.UserProfile]}).
    then((response)=>res.status(200).send(response)).
    catch((err)=> res.status(400).send(err))

})
route.get('/searchTransactions', (req, res, next) => {
    const searchName = req.query.name; // Get the name parameter from the query string
    
    db.Transaction.findAll({
        where: {
            [Op.or]: [
                { '$User.Username$': { [Op.like]: `%${searchName}%` } }, // Search in Username
                { '$User.UserProfile$': { [Op.like]: `%${searchName}%` } } // Search in UserProfile
            ]
        },
        include: [{
            model: db.User,
            attributes: ['Username', 'UserProfile']
        }]
    })
    .then((response) => res.status(200).send(response))
    .catch((err) => res.status(400).send(err));
});
route.get('/transactions',(req,res,next)=>{
    db.Transaction.findAll({include:[    {
        model: db.User,
        attributes: ['id','Username', 'UserProfile'] // Include only specific attributes
      }]}).
    then((response)=>res.status(200).send(response)).
    catch((err)=> res.status(400).send(err))

})
route.patch('/transaction/:id',(req,res,next)=>{
    db.Transaction.update({
        Date:req.body.Date,
        Total:req.body.Total,
        PaymentStatus:req.body.PaymentStatus,
        UserId:req.body.UserId
    },{where:{id:req.params.id}}).
        then((response)=>res.status(200).send(response)).
        catch((err)=> res.status(400).send(err))
})
route.delete('/transaction/:id',(req,res,next)=>{
    db.Transaction.destroy({where:{id:req.params.id}}).
    then((response)=>res.sendStatus(204)).
    catch((err)=> res.status(400).send(err))

})
module.exports=route