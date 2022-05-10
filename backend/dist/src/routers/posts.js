"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const { getPosts, votePost, addPost } = require("../controllers/posts");
const postsRouter = (0, express_1.Router)();
postsRouter.get("/", getPosts);
postsRouter.patch("/:postId/note", votePost);
postsRouter.post("/", addPost);
exports.default = postsRouter;
