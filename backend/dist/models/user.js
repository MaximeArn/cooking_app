"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.userSchema = void 0;
const mongoose_1 = require("mongoose");
exports.userSchema = new mongoose_1.Schema({
    age: { type: Number, default: null },
    name: { type: String, required: true },
    email: { type: String, required: true },
    password: { type: String, required: true },
    stars: { type: Number, default: 0 },
    subscribers: {
        type: [{ type: mongoose_1.Schema.Types.ObjectId, ref: "user" }],
        default: [],
    },
    subscriptions: {
        type: [{ type: mongoose_1.Schema.Types.ObjectId, ref: "user" }],
        default: [],
    },
    avatar: {
        type: String,
        default: `default_avatar.jpg`,
    },
    posts: { type: [{ type: mongoose_1.Schema.Types.ObjectId, ref: "post" }], default: [] },
    countryCode: { type: String, default: "FR" },
    groups: {
        type: [{ type: mongoose_1.Schema.Types.ObjectId, ref: "group" }],
        default: [],
    },
});
const userModel = (0, mongoose_1.model)("user", exports.userSchema);
exports.default = userModel;
