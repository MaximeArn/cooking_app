import { model, Model, Schema } from "mongoose";
import { ChallengeInterface, challengeSchema } from "./challenge";

export interface GroupInterface extends Document {
  members: String[];
  name: String;
  challenges: ChallengeInterface[];
}

export const groupSchema = new Schema({
  members: {
    type: [{ type: Schema.Types.ObjectId, ref: "user" }],
    default: [],
  },
  name: { type: String, required: true },
  challenges: { type: [challengeSchema], default: [] },
});

const groupModel: Model<GroupInterface> = model("group", groupSchema);
export default groupModel;
