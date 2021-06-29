import { Schema } from "mongoose";
import userModel from "./user";

const commentSchema = new Schema({
  content: { type: String, required: true },
  author: { type: userModel, required: true },
});
