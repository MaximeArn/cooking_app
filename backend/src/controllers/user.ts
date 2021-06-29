import { NextFunction, Response } from "express";
import User from "../../models/user";

module.exports = {
  addUser: async (_: Request, res: Response) => {
    try {
      const user1 = await new User({
        name: "Maxime",
        email: "maxime-arnould@outlook.fr",
        password: "strongPassword",
      }).save();
      res.send(user1);
    } catch (error) {
      console.log(error);
    }
  },
};
