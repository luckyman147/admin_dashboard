const joi =require('joi')
// const { resolve } = require('path')
const db=require('../models')
const bcrypt=require('bcrypt')
const { resolve } = require('path')

const jwt=require('jsonwebtoken')

const SchemaValidation=joi.object({
    Username:joi.string().required(),
    email:joi.string().email().required(),
    Phone:joi.string().regex(/^\d{8}$/)
    .required()
})
exports.register=(Username,email,Phone,UserProfile,JoiningDate)=>{
    return new Promise((resolve,reject)=>{
        let validation=SchemaValidation.validate({Username,email,Phone})
        if(validation.error){
            reject(validation.error.details[0].message)
        }
        db.User.count({where:{email:email}}).then(
            (count)=>{
                if(count>0){
                    reject({message:'email already exists'})
                }
                else{
                    
                        db.User.create({Username:Username,
                            email:email,
                            Phone:Phone,UserProfile:UserProfile,JoiningDate:JoiningDate}).then(
                                (response)=>resolve(response)
                            ).catch((err)=> reject(err))
                    }
                    
                }
            
        )

    })
}


