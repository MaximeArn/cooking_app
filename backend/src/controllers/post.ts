import { NextFunction, Request, Response } from "express";
import Post, { PostInterface } from "../../models/post";
import User from "../../models/user";

module.exports = {
  getPosts: async (_: Request, res: Response) => {
    try {
      const posts: PostInterface[] = await Post.find().populate({
        path: "authorId",
        model: "user",
        select: {
          name: 1,
          avatar: 1,
        },
      });
      res.json(posts);
    } catch (error) {
      console.log(error);
    }
  },

  votePost: async (
    { params: { postId }, body: { newNote, previousNote } }: Request,
    res: Response
  ) => {
    try {
      const updatedPost = await Post.findByIdAndUpdate(
        postId,
        { note: newNote },
        { useFindAndModify: false, new: true }
      );
      const starsToAdd: Number = newNote - previousNote;
      console.log(starsToAdd);
      await User.findByIdAndUpdate(updatedPost.authorId, {
        $stars: { $add: starsToAdd },
      });

      res.json(updatedPost);
    } catch (error) {
      console.log(error);
    }
  },

  addPost: async ({ body }: Request, res: Response, next: NextFunction) => {
    try {
      const newPost = await Post.create(body);
      res.json(newPost);
    } catch (error) {
      console.log(error);
    }
  },
};
