import { model, Model, Schema } from "mongoose";
import { PostInterface, postSchema } from "./post";

export interface ChallengeInterface extends Document {
  theme: String;
  isActive: boolean;
  posts: PostInterface[];
}

export const challengeSchema = new Schema({
  theme: { type: String, required: true },
  isActive: { type: Boolean, default: true },
  posts: { type: [postSchema], default: [] },
});

const challengeModel = model("challenge", challengeSchema);
export default challengeModel;
