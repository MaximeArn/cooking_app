import { Schema, model } from "mongoose";
import { ObjectId } from "mongodb";

export interface IChallenge {
  title: String;
  status: String;
  posts: [];
}

export const challengeSchema = new Schema({
  title: { type: String, required: true },
  status: { type: String, default: "open" },
  posts: { type: [ObjectId], ref: "post", default: [] },
});

const challengeModel = model<IChallenge>("challenge", challengeSchema);
export default challengeModel;
