import { NextFunction, Request, Response } from "express";

import Challenge from "../../models/challenge";
import Group from "../../models/group";
import Post from "../../models/post";

module.exports = {
  createChallenge: async (
    { params: { groupId }, body: newChallenge }: Request,
    res: Response,
    next: NextFunction
  ) => {
    try {
      const challenge = await Challenge.create(newChallenge);
      const updatedGroup = await Group.findByIdAndUpdate(
        groupId,
        { $push: { challenges: challenge._id } },
        { useFindAndModify: false, new: true }
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
      const updatedChallenge = await Challenge.findByIdAndUpdate(
        challengeId,
        {
          $push: { posts: challengePost },
        },
        { useFindAndModify: false }
      );
      return res.json(updatedChallenge).status(200);
    } catch (error) {
      console.error(error);
      next(error);
    }
  },
};
