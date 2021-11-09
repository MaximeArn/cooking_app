import { NextFunction, Request, Response } from "express";
import Challenge from "../../models/challenge";
import Group from "../../models/group";

module.exports = {
  createChallenge: async (
    { params: { groupId } }: Request,
    res: Response,
    next: NextFunction
  ) => {
    try {
      const newChallenge = {
        theme: "dishes",
        active: true,
      };
      const challenge = await Challenge.create(newChallenge);
      console.log(challenge);
      const updatedGroup = await Group.findByIdAndUpdate(
        groupId,
        { $push: { challenges: challenge } },
        { useFindAndModify: false }
      );
      res.send(updatedGroup).status(200);
    } catch (error) {
      console.error(error);
      next(error);
    }
  },
};
