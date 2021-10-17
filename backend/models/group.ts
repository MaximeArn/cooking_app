import { model, Model, Schema } from "mongoose";

export interface GroupInterface extends Document {
  members: String[];
  name: String;
}

export const groupSchema = new Schema({
  members: {
    type: [{ type: Schema.Types.ObjectId, ref: "user" }],
    default: [],
  },
  name: { type: String, required: true },
});

const groupModel: Model<GroupInterface> = model("group", groupSchema);
export default groupModel;
