import { Schema, model } from "mongoose";
import { ObjectId } from "mongodb";
import { IChallenge } from "./challenge";

interface IGroup {
  title: String;
  avatar: String;
  challenges: [IChallenge];
  members: [];
}

export const groupSchema = new Schema({
  title: { type: String, required: true },
  avatar: { type: String, default: "default_group.jpeg" },
  challenges: { type: [], default: [] },
  members: { type: [ObjectId], ref: "user", default: [] },
});

const groupModel = model<IGroup>("group", groupSchema);
export default groupModel;
