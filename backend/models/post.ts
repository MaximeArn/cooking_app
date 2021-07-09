import { Schema, model } from "mongoose";
import { ObjectId } from "mongodb";

// export type PostType = {
//   authorId: String;
//   images: Array<String>;
//   note: Number;
//   description: String;
//   comments: Array<String>;
// };

export const postSchema = new Schema({
  // authorId: { type: ObjectId, required: true },
  authorId: { type: ObjectId, default: new ObjectId() }, // provisional default for the seed
  images: { type: [String], required: true },
  note: { type: Number, default: null }, // maybe an "Note" documents array
  description: { type: String, required: true },
  comments: { type: [ObjectId], default: [] },
});

export default model("post", postSchema);
