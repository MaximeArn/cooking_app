import { Schema, model, Document, Model } from "mongoose";
import { ObjectId } from "mongodb";
import { UserInterface } from "./user";

export interface PostInterface extends Document {
  author: String | UserInterface;
  images: String[];
  note: Number;
  description: String;
  comments: String[];
  belongsToChallenge: Boolean;
}

export const postSchema = new Schema({
  authorId: { type: ObjectId, required: true },
  belongsToChallenge: { type: Boolean, default: false },
  images: { type: [String], required: true },
  note: { type: Number, default: null }, // maybe an "Note" documents array
  description: { type: String, required: true },
  comments: { type: [Schema.Types.ObjectId], default: [] },
});

const postModel: Model<PostInterface> = model("post", postSchema);
export default postModel;
