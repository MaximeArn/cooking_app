import { NextFunction, Request, Response } from "express";
import User from "../../models/user";

module.exports = {
  getUserById: async ({ params: { userId } }: Request, res: Response) => {
    try {
      const user = await User.findById(userId);
      res.json(user);
      console.log(user);
    } catch (error) {
      console.log(error);
    }
  },
};
