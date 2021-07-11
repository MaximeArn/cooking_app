import { model, Schema } from "mongoose";

export const commentSchema = new Schema({
  content: { type: String, required: true },
  author: { type: String, required: true },
});

export default model("comment", commentSchema);
