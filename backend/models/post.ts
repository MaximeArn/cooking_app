import { Schema, model } from "mongoose";
import { commentSchema } from "./comment";

export const postSchema = new Schema({
  author: { type: String, required: true },
  image: { type: String, required: true },
  note: { type: Number, default: null },
  description: { type: String, required: true },
  comments: { type: [commentSchema], default: [] },
});

export default model("post", postSchema);
