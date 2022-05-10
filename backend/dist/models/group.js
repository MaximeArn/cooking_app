"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.groupSchema = void 0;
const mongoose_1 = require("mongoose");
exports.groupSchema = new mongoose_1.Schema({
    members: {
        type: [{ type: mongoose_1.Schema.Types.ObjectId, ref: "user" }],
        default: [],
    },
    name: { type: String, required: true },
    challenges: { type: [mongoose_1.Schema.Types.ObjectId], ref: "challenge", default: [] },
});
const groupModel = (0, mongoose_1.model)("group", exports.groupSchema);
exports.default = groupModel;
