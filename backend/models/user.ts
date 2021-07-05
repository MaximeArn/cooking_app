import { Schema, model } from "mongoose";
import { postSchema } from "./post";

const PORT = process.env.PORT;

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
  posts: { type: [postSchema], default: [] },
});

export default model("user", userSchema);
