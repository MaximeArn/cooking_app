import { Schema, model } from "mongoose";

const rewardSchema = new Schema({
  image: { type: String, required: true },
  price: { type: Number, required: true },
  title: { type: String, required: true },
  description: { type: String, required: true },
});

export default model("reward", rewardSchema);
