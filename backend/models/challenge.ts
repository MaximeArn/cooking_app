import { Schema, model } from "mongoose";
import { ObjectId } from "mongodb";

export const challengeSchema = new Schema({
  title: { type: String, required: true },
  status: { type: String, default: "open" },
  posts: { type: [ObjectId], ref: "post", default: [] },
});

const challengeModel = model("challenge", challengeSchema);
export default challengeModel;
