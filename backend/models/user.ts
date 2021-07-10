import { Schema, model, Document, Model } from "mongoose";
import { ObjectId } from "mongodb";

const PORT = process.env.PORT;

export interface UserInterface extends Document {
  name: String;
  email: String;
  password: String;
  stars: Number;
  subscribers: Number;
  subscriptions: Number;
  avatar: String;
  posts: String[];
}

export const userSchema = new Schema({
  name: { type: String, required: true },
  email: { type: String, required: true },
  password: { type: String, required: true },
  stars: { type: Number, default: 0 },
  subscribers: { type: Number, default: 0 },
  subscriptions: { type: Number, default: 0 },
  avatar: {
    type: String,
    default: `http://localhost:4545/assets/images/avatars/default_avatar.jpg`,
  },
  posts: { type: [ObjectId], default: [] },
});

const userModel: Model<UserInterface> = model("user", userSchema);
export default userModel;
