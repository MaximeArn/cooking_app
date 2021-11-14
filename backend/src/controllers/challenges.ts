import { NextFunction, Request, Response } from "express";

import Challenge from "../../models/challenge";
import Group from "../../models/group";
import Post from "../../models/post";

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

  insertPost: async (
    { params: { challengeId }, body }: Request,
    res: Response,
    next: NextFunction
  ) => {
    try {
      const challengePost = await Post.create(body);
      console.log(challengePost);

      const updatedChallenge = await Challenge.findByIdAndUpdate(
        challengeId,
        {
          $push: { posts: challengePost },
        },
        { useFindAndModify: false }
      );
      res.json(updatedChallenge).status(200);
    } catch (error) {
      console.error(error);
      next(error);
    }
  },
};
