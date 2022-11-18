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
const user_1 = __importDefault(require("../../models/user"));
module.exports = {
    createGroup: ({ body: { title }, file, params: { id } }, res, next) => __awaiter(void 0, void 0, void 0, function* () {
        try {
            const newGroup = yield group_1.default.create({ title, members: [id] });
            console.log(newGroup._id);
            const updatedConnectedUser = yield user_1.default.findByIdAndUpdate(id, {
                $push: { groups: newGroup._id },
            }, { useFindAndModify: false, new: true }).populate({
                path: "groups",
                model: "group",
            });
            console.log(updatedConnectedUser);
            res.json(updatedConnectedUser);
        }
        catch (error) {
            console.error(error);
            next(error);
        }
    }),
};
