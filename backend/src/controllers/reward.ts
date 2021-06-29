import { Response } from "express";
import Reward from "../../models/reward";

module.exports = {
  getRewards: async (req: Request, res: Response) => {
    try {
      const rewards = await Reward.find();
      res.json(rewards);
    } catch (error) {
      console.log(error);
    }
  },
};
