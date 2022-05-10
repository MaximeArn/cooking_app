import { Schema, model, Document, Model } from "mongoose";

export interface UserInterface extends Document {
  name: String;
  email: String;
  password: String;
  stars: Number;
  subscribers: String[];
  subscriptions: String[];
  avatar: String;
  posts: String[];
  countryCode: String;
  groups: String[];
}

export const userSchema = new Schema({
  age: { type: Number, default: null },
  name: { type: String, required: true },
  email: { type: String, required: true },
  password: { type: String, required: true },
  stars: { type: Number, default: 0 },
  subscribers: {
    type: [{ type: Schema.Types.ObjectId, ref: "user" }],
    default: [],
  },
  subscriptions: {
    type: [{ type: Schema.Types.ObjectId, ref: "user" }],
    default: [],
  },
  avatar: {
    type: String,
    default: `/assets/images/avatars/default_avatar.jpg`,
  },
  posts: { type: [{ type: Schema.Types.ObjectId, ref: "post" }], default: [] },
  countryCode: { type: String, default: "FR" },
  groups: {
    type: [{ type: Schema.Types.ObjectId, ref: "group" }],
    default: [],
  },
});

const userModel = model("user", userSchema);
export default userModel;
