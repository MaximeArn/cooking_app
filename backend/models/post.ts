import { Schema, model } from "mongoose";

const postSchema = new Schema({
  image: { type: String, required: true },
  note: { type: Number, default: null },
  comments: [],
});

export default model("post", postSchema);
