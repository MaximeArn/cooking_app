import { NextFunction, Request, Response } from "express";
import { pathToFileURL } from "url";
import User, { IUser } from "../../models/user";
import { hashPassword } from "../utils/passwordHash";
const { deleteImage } = require("./images");

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
      const user: IUser = await User.findOne({ email: email })
        .populate({
          path: "posts",
          model: "post",
        })
        .populate({
          path: "groups",
          model: "group",
        });
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
      const user: IUser = await User.findById(id).populate({
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
      const filteredUsers: IUser[] = await User.find(filterObject, {
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

  updateUser: async (
    { params: { id }, body }: Request,
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
      console.log(body.avatar);

      const newUser = await User.findByIdAndUpdate(id, filteredBody, {
        useFindAndModify: false,
        new: true,
      }).populate({
        path: "posts",
        model: "post",
      });

      res.status(200).json(newUser);
      res.end();
    } catch (error) {
      console.error(error);
      next(error);
    }
  },

  deleteUser: async (
    { params: { id } }: Request,
    res: Response,
    next: NextFunction
  ) => {
    try {
      const { avatar } = await User.findByIdAndDelete(id);
      await deleteImage(avatar);
      res.sendStatus(200);
    } catch (error) {
      console.error(error);
      next(error);
    }
  },

  getNationalRanking: async (
    { params: { countryCode, connectedUserStars } }: Request,
    res: Response,
    next: NextFunction
  ) => {
    try {
      console.log(connectedUserStars);
      const ranking = await User.find(
        { countryCode: countryCode },
        { name: 1, avatar: 1, stars: 1 }
      )
        .sort({ stars: "descending" })
        .limit(10);

      const connectedUserRank = await User.countDocuments({
        stars: { $gte: parseInt(connectedUserStars) },
        countryCode: countryCode,
      });

      res.json({ ranking, connectedUserRank }).status(200);
    } catch (error) {
      console.error(error);
      next(error);
    }
  },
};
