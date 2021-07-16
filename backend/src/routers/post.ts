import { Router } from "express";
const { getPosts, votePost, addPost } = require("../controllers/post");

const postRouter = Router();

postRouter.get("/", getPosts);
postRouter.patch("/:postId/note", votePost);
postRouter.post("/", addPost);

export default postRouter;
