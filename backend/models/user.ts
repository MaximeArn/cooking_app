import { Schema, model } from "mongoose";
import { postSchema } from "./post";

const PORT = process.env.PORT;

export const userSchema = new Schema({
  name: { type: String, required: true },
  email: { type: String, required: true },
  password: { type: String, required: true },
  avatar: {
    type: String,
    default: `http://localhost:${PORT}/assets/images/avatar/default_avatar.jpg`,
  },
  posts: { type: [postSchema], default: [] },
});

export default model("user", userSchema);
