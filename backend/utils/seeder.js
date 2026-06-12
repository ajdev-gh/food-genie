import path from "path";
import { fileURLToPath } from "url";
import fs from "fs";
import mongoose from "mongoose";
import dotenv from "dotenv";
import Fooditem from "../models/foodItem.js"; 

const __dirname = path.dirname(fileURLToPath(import.meta.url));

dotenv.config({ path: path.resolve(__dirname, "../config/.env") });

const fooditems = JSON.parse(
  fs.readFileSync(path.resolve(__dirname, "../data/foodItem.json"), "utf-8")
);

const seedFooditems = async () => {
  try {
    await mongoose.connect(process.env.DB_URI);
    console.log("Database connected for seeding...");

    await Fooditem.deleteMany();
    console.log("Existing FoodItems deleted.");

    await Fooditem.insertMany(fooditems);
    console.log("All sample FoodItems successfully injected.");

    process.exit(0);
  } catch (error) {
    console.error("Seeding operation failed:", error.message);
    process.exit(1);
  }
};

seedFooditems();
