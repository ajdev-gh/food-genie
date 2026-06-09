import path from "path";
import { fileURLToPath } from "url";
import dotenv from "dotenv";
import mongoose from "mongoose";
import app from "./app.js";

const __dirname = path.dirname(fileURLToPath(import.meta.url));

dotenv.config({ path: path.resolve(__dirname, "./config/.env") });

const PORT = process.env.PORT || 5000;
const DB_URI = process.env.DB_URI;

mongoose
  .connect(DB_URI)
  .then(() => {
    console.log("Connected to MongoDB database successfully");
    app.listen(PORT, () => {
      console.log(`Server executing live on port ${PORT}`);
    });
  })
  .catch((err) => {
    console.error("Database connection failed", err.message);
    process.exit(1);
  });
