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
const user_1 = __importDefault(require("../../models/user"));
const passwordHash_1 = require("../utils/passwordHash");
const { deleteImage } = require("./images");
module.exports = {
    createUser: ({ body }, res, next) => __awaiter(void 0, void 0, void 0, function* () {
        try {
            console.log(body);
            const user = yield user_1.default.create(Object.assign(Object.assign({}, body), { password: yield (0, passwordHash_1.hashPassword)(body.password) }));
            res.json(user).status(200);
        }
        catch (error) {
            console.log(error);
            next(error);
        }
    }),
    getUserByEmail: ({ params: { email } }, res, next) => __awaiter(void 0, void 0, void 0, function* () {
        try {
            const user = yield user_1.default.findOne({ email: email }).populate({
                path: "posts",
                model: "post",
            });
            res.json(user);
        }
        catch (error) {
            console.error(error);
            next(error);
        }
    }),
    getUserById: ({ params: { id } }, res, next) => __awaiter(void 0, void 0, void 0, function* () {
        try {
            console.log(id);
            const user = yield user_1.default.findById(id).populate({
                path: "posts",
                model: "post",
            });
            console.log(user);
            res.json(user);
        }
        catch (error) {
            console.error(error);
            next(error);
        }
    }),
    getUsersByName: ({ params: { filter } }, res, next) => __awaiter(void 0, void 0, void 0, function* () {
        try {
            const filterObject = {
                name: { $regex: `^${filter}`, $options: "i" },
            };
            const filteredUsers = yield user_1.default.find(filterObject, {
                name: 1,
                avatar: 1,
            });
            res.json(filteredUsers);
        }
        catch (error) {
            console.error(error);
            next(error);
        }
    }),
    getFriendsByName: ({ params: { filter, connectedUserId } }, res, next) => __awaiter(void 0, void 0, void 0, function* () {
        try {
            const { subscribers } = yield user_1.default.findById(connectedUserId).populate({
                path: "subscribers",
                model: "user",
            });
            const regExp = new RegExp(`^${filter.toLocaleLowerCase()}`, "i");
            const filteredUsers = subscribers.filter((subscriber) => regExp.test(subscriber.name));
            res.json(filteredUsers);
        }
        catch (error) {
            console.error(error);
            next(error);
        }
    }),
    updateUser: ({ params: { id }, body }, res, next) => __awaiter(void 0, void 0, void 0, function* () {
        try {
            const filteredBody = {};
            for (const key in body) {
                if (body[key] != "") {
                    key == "password"
                        ? (filteredBody[key] = yield (0, passwordHash_1.hashPassword)(body[key]))
                        : (filteredBody[key] = body[key]);
                }
            }
            console.log(body.avatar);
            const newUser = yield user_1.default.findByIdAndUpdate(id, filteredBody, {
                useFindAndModify: false,
                new: true,
            }).populate({
                path: "posts",
                model: "post",
            });
            res.status(200).json(newUser);
            res.end();
        }
        catch (error) {
            console.error(error);
            next(error);
        }
    }),
    deleteUser: ({ params: { id } }, res, next) => __awaiter(void 0, void 0, void 0, function* () {
        try {
            const { avatar } = yield user_1.default.findByIdAndDelete(id);
            yield deleteImage(avatar);
            res.sendStatus(200);
        }
        catch (error) {
            console.error(error);
            next(error);
        }
    }),
    getNationalRanking: ({ params: { countryCode } }, res, next) => __awaiter(void 0, void 0, void 0, function* () {
        try {
            const ranking = yield user_1.default.find({ countryCode: countryCode }, { name: 1, avatar: 1, stars: 1 })
                .sort({ stars: "descending" })
                .limit(10);
            res.json(ranking).status(200);
        }
        catch (error) {
            console.error(error);
            next(error);
        }
    }),
};
