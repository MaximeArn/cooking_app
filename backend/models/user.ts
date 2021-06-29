import { Schema, model } from "mongoose";
import { postSchema } from "./post";

export const userSchema = new Schema({
  name: { type: String, required: true },
  email: { type: String, required: true },
  password: { type: String, required: true },
  avatar: { type: String, default: "" },
  posts: { type: [postSchema], default: [] },
});

export default model("user", userSchema);
