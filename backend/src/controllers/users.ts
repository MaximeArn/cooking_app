import { NextFunction, Request, Response } from "express";
import User, { UserInterface } from "../../models/user";
import { hashPassword } from "../utils/passwordHash";

module.exports = {
  getUserById: async (
    { params: { userId } }: Request,
    res: Response,
    next: NextFunction
  ) => {
    try {
      const user: UserInterface = await User.findById(userId).populate({
        path: "posts",
        model: "post",
      });
      res.json(user);
    } catch (error) {
      console.error(error);
      next(error);
    }
  },

  getUsersByName: async (
    { params: { filter } }: Request,
    res: Response,
    next: NextFunction
  ) => {
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
      console.error(error);
      next(error);
    }
  },

  updateProfile: async (
    { params: { userId }, body }: Request,
    res: Response,
    next: NextFunction
  ) => {
    try {
      const filteredBody: any = {};
      for (const key in body) {
        if (body[key] != "") {
          key == "password"
            ? (filteredBody[key] = await hashPassword(body[key]))
            : (filteredBody[key] = body[key]);
        }
      }

      const newUser = await User.findByIdAndUpdate(userId, filteredBody, {
        useFindAndModify: false,
      }).populate({
        path: "posts",
        model: "post",
      });

      res.status(200).json(newUser);
    } catch (error) {
      console.error(error);
      next(error);
    }
  },

  getNationalRanking: async (
    { params: { countryCode } }: Request,
    res: Response,
    next: NextFunction
  ) => {
    try {
      const ranking = await User.find(
        { countryCode: countryCode },
        { name: 1, avatar: 1, stars: 1 }
      )
        .sort({ stars: "descending" })
        .limit(10);
      res.json(ranking).status(200);
    } catch (error) {
      console.error(error);
      next(error);
    }
  },
};
