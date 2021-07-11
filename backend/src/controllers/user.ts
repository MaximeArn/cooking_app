import { NextFunction, Request, Response } from "express";
import User, { UserInterface } from "../../models/user";

module.exports = {
  getUserById: async ({ params: { userId } }: Request, res: Response) => {
    try {
      const user: UserInterface = await User.findById(userId);
      res.json(user);
    } catch (error) {
      console.log(error);
    }
  },
  getUsersByName: async ({ params: { filter } }: Request, res: Response) => {
    try {
      const filterObject: any = {
        name: { $regex: `^${filter}`, $options: "i" },
      };
      const filteredUsers: UserInterface[] = await User.find(filterObject);
      res.json(filteredUsers);
    } catch (error) {
      console.log(error);
    }
  },
};
