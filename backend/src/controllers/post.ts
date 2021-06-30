import { Request, Response } from "express";
import Post from "../../models/post";

module.exports = {
  getPosts: async (req: Request, res: Response) => {
    try {
      const posts = await Post.find();
      res.json(posts);
    } catch (error) {
      console.log(error);
    }
  },

  votePost: async (
    { params: { postId }, body: { newNote } }: Request,
    res: Response
  ) => {
    try {
      const updatedPost = await Post.findByIdAndUpdate(
        postId,
        { note: newNote },
        { useFindAndModify: true, new: true }
      );
      res.json(updatedPost);
    } catch (error) {
      console.log(error);
    }
  },
};
