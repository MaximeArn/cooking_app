import { Schema, model } from "mongoose";
import { ObjectId } from "mongodb";

export const postSchema = new Schema({
  authorId: { type: ObjectId, required: true },
  images: { type: [String], required: true },
  note: { type: Number, default: null }, // maybe an "Note" documents array
  description: { type: String, required: true },
  comments: { type: [ObjectId], default: [] },
});

export default model("post", postSchema);
