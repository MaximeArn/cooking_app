"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const post_1 = __importDefault(require("../../models/post"));
const user_1 = __importDefault(require("../../models/user"));
module.exports = {
    getPosts: (_, res, next) => __awaiter(void 0, void 0, void 0, function* () {
        try {
            const posts = yield post_1.default.find({
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
        }
        catch (error) {
            console.error(error);
            next(error);
        }
    }),
    votePost: ({ params: { postId }, body: { newNote, previousNote } }, res, next) => __awaiter(void 0, void 0, void 0, function* () {
        try {
            const updatedPost = yield post_1.default.findByIdAndUpdate(postId, { note: newNote }, { useFindAndModify: false, new: true });
            const starsToAdd = newNote - previousNote;
            console.log(starsToAdd);
            yield user_1.default.findByIdAndUpdate(updatedPost.author, {
                $inc: { stars: starsToAdd },
            });
            res.json(updatedPost);
        }
        catch (error) {
            console.error(error);
            next(error);
        }
    }),
    addPost: ({ body }, res, next) => __awaiter(void 0, void 0, void 0, function* () {
        try {
            const newPost = yield post_1.default.create(body);
            res.json(newPost);
        }
        catch (error) {
            console.error(error);
            next(error);
        }
    }),
};
