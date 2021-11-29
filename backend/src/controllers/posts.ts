import { NextFunction, Request, Response } from "express";
import Post, { PostInterface } from "../../models/post";
import User from "../../models/user";

module.exports = {
  getPosts: async (_: Request, res: Response, next: NextFunction) => {
    try {
      const posts: PostInterface[] = await Post.find({
        belongsToChallenge: false,
      }).populate({
        path: "author",
        model: "user",
        select: {
          name: 1,
          avatar: 1,
        },
      });
      res.json(posts);
    } catch (error) {
      console.error(error);
      next(error);
    }
  },

  votePost: async (
    { params: { postId }, body: { newNote, previousNote } }: Request,
    res: Response,
    next: NextFunction
  ) => {
    try {
      const updatedPost = await Post.findByIdAndUpdate(
        postId,
        { note: newNote },
        { useFindAndModify: false, new: true }
      );
      const starsToAdd: Number = newNote - previousNote;
      console.log(starsToAdd);
      await User.findByIdAndUpdate(updatedPost.author, {
        $inc: { stars: starsToAdd },
      });

      res.json(updatedPost);
    } catch (error) {
      console.error(error);
      next(error);
    }
  },

  addPost: async ({ body }: Request, res: Response, next: NextFunction) => {
    try {
      const newPost = await Post.create(body);
      res.json(newPost);
    } catch (error) {
      console.error(error);
      next(error);
    }
  },
};
