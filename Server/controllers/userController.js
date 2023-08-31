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
    .required(),
    UserProfile:joi.string().valid('B2B','B2C'),
    password:joi.string().required(),
    JoiningDate:joi.date().required(),
    BirthDate:joi.date().required(),
    userImage:joi.string(),
    Genre:joi.string().required(),
    Sex: joi.string().valid('Male','Female','Other'),
    Adress:joi.string()


})

exports.register = async (
    Username,
    email,
    Phone,
    
    UserProfile,
    password,
    JoiningDate,
    BirthDate,
    userImage,
    Genre,
    Sex,
    Adress
  ) => {
    try {
      const validation = SchemaValidation.validate({
        Username,
        email,
        Phone,
        UserProfile,
        password,
        JoiningDate,
        BirthDate,
        userImage,
        Genre,
        Sex,
        Adress,
      });
  
      if (validation.error) {
        throw new Error(validation.error.details[0].message);
      }
  
      const count = await db.User.count({ where: { email: email } });
  
      if (count > 0) {
        throw new Error('Email already exists');
      }
  
      const hashedPassword = bcrypt.hashSync(password, 10);
  
      const newUser = await db.User.create({
        Username,
        email,
        Phone,
        UserProfile,
        password: hashedPassword,
        JoiningDate,
        BirthDate,
        userImage,
        Genre,
        Sex,
        Adress,
      });
  
      return newUser;
    } catch (error) {
      throw error;
    }
  };
  

