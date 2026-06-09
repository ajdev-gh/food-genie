import mongoose from "mongoose";
import validator, { isEmail } from "validator";
import bcrypt from "bcryptjs";
import jwt from "jsonwebtoken";
import crypto from "crypto";

const userSchema = new mongoose.Schema({
  name: {
    type: String,
    required: [true, "Please enter your name"],
    maxlength: [50, "Name cannot exceed 50 characters"],
  },
  email: {
    type: String,
    required: [true, "Please enter your email"],
    maxlength: [100, "Email cannot exceed 100 characters"],
    unique: true,
    lowercase: true,
    validate: [validator.isEmail, "Enter valid email"],
  },
  password: {
    type: String,
    required: [true, "Please enter a password"],
    minlength: 8,
    select: false,
  },
  passwordConfirm: {
    type: String,
    required: [true, "Enter password again"],
    validate: {
      validator: function (el) {
        return el === this.password;
      },
      message: "Passwords are not same",
    },
  },
  phone: {
    type: String,
    required: true,
    match: [/^[0-9]{10}$/, "Enter valid phone number"],
  },
  role: {
    type: String,
    enum: ["user", "admin"],
    default: "user",
  },
});
