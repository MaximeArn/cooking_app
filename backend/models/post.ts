import { Schema, model } from "mongoose";
import commentModel from "./comment";

const postSchema = new Schema({
  image: { type: String, required: true },
  note: { type: Number, default: null },
  comments: [commentModel],
});

export default model("post", postSchema);
