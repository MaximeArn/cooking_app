import { Router } from "express";
const { getPosts, votePost, addPost } = require("../controllers/post");

const postsRouter = Router();

postsRouter.get("/", getPosts);
postsRouter.patch("/:postId/note", votePost);
postsRouter.post("/", addPost);

export default postsRouter;
