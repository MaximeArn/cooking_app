import { NextFunction, Request, Response } from "express";
import Challenge from "../../models/challenge";
import Group from "../../models/group";
import User from "../../models/user";

module.exports = {
  createGroup: async (
    { body: { title }, file, params: { id } }: Request,
    res: Response,
    next: NextFunction
  ) => {
    try {
      const newGroup = await Group.create({ title, members: [id] });
      console.log(newGroup._id);

      const updatedConnectedUser = await User.findByIdAndUpdate(
        id,
        {
          $push: { groups: newGroup._id },
        },
        { useFindAndModify: false, new: true }
      ).populate({
        path: "groups",
        model: "group",
      });

      console.log(updatedConnectedUser);

      res.json(updatedConnectedUser);
    } catch (error) {
      console.error(error.message);
      next(error);
    }
  },

  createChallenge: async (
    { body: { groupId, title } }: Request,
    res: Response,
    next: NextFunction
  ) => {
    try {
      const group = await Group.findById(groupId);
      const alreadyAChallengeOpen: boolean = group.challenges.some(
        (chall) => chall.status === "open"
      );
      if (alreadyAChallengeOpen) {
        throw new Error("There is already a challenge open in this group");
      } else {
        const challenge = new Challenge({
          title: title,
        });
        group.challenges.push(challenge);
        await group.save();
      }
      res.json(group);
    } catch (error) {
      res.status(500).send(error.message);
      console.error(error);
    }
  },
};
