import { model, Schema } from "mongoose";
import userModel from "./user";

const commentSchema = new Schema({
  content: { type: String, required: true },
  author: { type: userModel, required: true },
});

export default model("comment", commentSchema);
