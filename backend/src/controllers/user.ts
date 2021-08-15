import { NextFunction, Request, Response } from "express";
import User, { UserInterface } from "../../models/user";
import { hashPassword } from "../utils/passwordHash";

module.exports = {
  getUserById: async ({ params: { userId } }: Request, res: Response) => {
    try {
      const user: UserInterface = await User.findById(userId).populate({
        path: "posts",
        model: "post",
      });
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
      const filteredUsers: UserInterface[] = await User.find(filterObject, {
        name: 1,
        avatar: 1,
      });
      res.json(filteredUsers);
    } catch (error) {
      console.log(error);
    }
  },
  updateProfile: async (
    { params: { userId }, body }: Request,
    res: Response
  ) => {
    try {
      const passwordIsHashed = body.password.length == 60;
      const newUser = await User.findByIdAndUpdate(
        userId,
        passwordIsHashed
          ? { body }
          : { ...body, password: await hashPassword(body.password) },
        {
          useFindAndModify: false,
        }
      ).populate({
        path: "posts",
        model: "post",
      });
      res.status(200).json(newUser);
    } catch (error) {
      console.log(error);
    }
  },
};
