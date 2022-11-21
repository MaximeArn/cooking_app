import { Schema, model } from "mongoose";
import { ObjectId } from "mongodb";

export const groupSchema = new Schema({
  title: { type: String, required: true },
  avatar: { type: String, default: "default_group.jpeg" },
  challenges: { type: [], default: [] },
  members: { type: [ObjectId], ref: "user", default: [] },
});

const groupModel = model("group", groupSchema);
export default groupModel;
