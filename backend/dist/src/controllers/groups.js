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
const group_1 = __importDefault(require("../../models/group"));
module.exports = {
    createGroup: ({ body, params: { connectedUser } }, res, next) => __awaiter(void 0, void 0, void 0, function* () {
        try {
            const group = {
                name: body.name,
                members: [...body.members.map((member) => member.id), connectedUser],
            };
            const newGroup = yield group_1.default.create(group);
            res.json(newGroup).status(200);
        }
        catch (error) {
            console.error(error);
            next(error);
        }
    }),
    getGroups: ({ params: { connectedUser } }, res) => __awaiter(void 0, void 0, void 0, function* () {
        const groups = yield group_1.default.find({ members: connectedUser });
        res.json(groups);
    }),
    getGroupById: ({ params: { groupId } }, res, next) => __awaiter(void 0, void 0, void 0, function* () {
        try {
            const group = yield group_1.default.findById(groupId)
                .populate({
                path: "members",
                select: {
                    name: 1,
                    avatar: 1,
                },
            })
                .populate({
                path: "challenges",
                match: {
                    isActive: false,
                },
                populate: {
                    path: "posts.author",
                    model: "user",
                    select: {
                        name: 1,
                        avatar: 1,
                    },
                },
            });
            res.json(group).status(200);
        }
        catch (error) {
            console.error(error);
            next(error);
        }
    }),
};
