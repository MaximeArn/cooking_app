import { Schema, model } from "mongoose";
import commentModel from "./comments";

const postSchema = new Schema({
  image: { type: String, required: true },
  note: { type: Number, default: null },
  comments: [commentModel],
});

export default model("post", postSchema);
