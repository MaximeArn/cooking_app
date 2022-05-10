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
const challenge_1 = __importDefault(require("../../models/challenge"));
const group_1 = __importDefault(require("../../models/group"));
const post_1 = __importDefault(require("../../models/post"));
module.exports = {
    createChallenge: ({ params: { groupId }, body: newChallenge }, res, next) => __awaiter(void 0, void 0, void 0, function* () {
        try {
            const challenge = yield challenge_1.default.create(newChallenge);
            const updatedGroup = yield group_1.default.findByIdAndUpdate(groupId, { $push: { challenges: challenge._id } }, { useFindAndModify: false, new: true });
            res.send(updatedGroup).status(200);
        }
        catch (error) {
            console.error(error);
            next(error);
        }
    }),
    insertPost: ({ params: { challengeId }, body }, res, next) => __awaiter(void 0, void 0, void 0, function* () {
        try {
            const challengePost = yield post_1.default.create(body);
            const updatedChallenge = yield challenge_1.default.findByIdAndUpdate(challengeId, {
                $push: { posts: challengePost },
            }, { useFindAndModify: false });
            return res.json(updatedChallenge).status(200);
        }
        catch (error) {
            console.error(error);
            next(error);
        }
    }),
};
