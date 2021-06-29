import { Schema, model } from "mongoose";
import { commentSchema } from "./comment";

export const postSchema = new Schema({
  image: { type: String, required: true },
  note: { type: Number, default: null },
  comments: { type: [commentSchema], default: [] },
});

export default model("post", postSchema);
