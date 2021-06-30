import { Router } from "express";
const { getPosts, votePost } = require("../controllers/post");

const postRouter = Router();

postRouter.get("/", getPosts);
postRouter.patch("/:postId", votePost);

export default postRouter;
