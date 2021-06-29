import { Schema, model } from "mongoose";
import postModel from "./post";

const userSchema = new Schema({
  name: { type: String, required: true },
  email: { type: String, required: true },
  password: { type: String, required: true },
  avatar: { type: String, default: "" },
  posts: [postModel],
});

export default model("user", userSchema);
