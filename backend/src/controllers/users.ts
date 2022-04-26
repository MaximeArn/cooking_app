import { NextFunction, Request, Response } from "express";
import User, { UserInterface } from "../../models/user";
import { hashPassword } from "../utils/passwordHash";

module.exports = {
  createUser: async ({ body }: Request, res: Response, next: NextFunction) => {
    try {
      console.log(body);
      const user = await User.create({
        ...body,
        password: await hashPassword(body.password),
      });
      res.json(user).status(200);
    } catch (error) {
      console.log(error);
      next(error);
    }
  },

  getUserByEmail: async (
    { params: { email } }: Request,
    res: Response,
    next: NextFunction
  ) => {
    try {
      const user: UserInterface = await User.findOne({ email: email }).populate(
        {
          path: "posts",
          model: "post",
        }
      );
      res.json(user);
    } catch (error) {
      console.error(error);
      next(error);
    }
  },

  getUserById: async (
    { params: { id } }: Request,
    res: Response,
    next: NextFunction
  ) => {
    try {
      console.log(id);
      const user: UserInterface = await User.findById(id).populate({
        path: "posts",
        model: "post",
      });
      console.log(user);
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

  getFriendsByName: async (
    { params: { filter, connectedUserId } }: Request,
    res: Response,
    next: NextFunction
  ) => {
    try {
      const { subscribers } = await User.findById(connectedUserId).populate({
        path: "subscribers",
        model: "user",
      });

      const regExp = new RegExp(`^${filter.toLocaleLowerCase()}`, "i");

      const filteredUsers = subscribers.filter((subscriber: any) =>
        regExp.test(subscriber.name)
      );

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
        new: true,
      }).populate({
        path: "posts",
        model: "post",
      });

      console.log(newUser);

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
