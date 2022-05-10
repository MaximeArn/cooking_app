"use strict";
var __createBinding =
  (this && this.__createBinding) ||
  (Object.create
    ? function (o, m, k, k2) {
        if (k2 === undefined) k2 = k;
        var desc = Object.getOwnPropertyDescriptor(m, k);
        if (
          !desc ||
          ("get" in desc ? !m.__esModule : desc.writable || desc.configurable)
        ) {
          desc = {
            enumerable: true,
            get: function () {
              return m[k];
            },
          };
        }
        Object.defineProperty(o, k2, desc);
      }
    : function (o, m, k, k2) {
        if (k2 === undefined) k2 = k;
        o[k2] = m[k];
      });
var __setModuleDefault =
  (this && this.__setModuleDefault) ||
  (Object.create
    ? function (o, v) {
        Object.defineProperty(o, "default", { enumerable: true, value: v });
      }
    : function (o, v) {
        o["default"] = v;
      });
var __importStar =
  (this && this.__importStar) ||
  function (mod) {
    if (mod && mod.__esModule) return mod;
    var result = {};
    if (mod != null)
      for (var k in mod)
        if (k !== "default" && Object.prototype.hasOwnProperty.call(mod, k))
          __createBinding(result, mod, k);
    __setModuleDefault(result, mod);
    return result;
  };
var __importDefault =
  (this && this.__importDefault) ||
  function (mod) {
    return mod && mod.__esModule ? mod : { default: mod };
  };
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = __importStar(require("express"));
const mongoose_1 = __importDefault(require("mongoose"));
const users_1 = __importDefault(require("./src/routers/users"));
const posts_1 = __importDefault(require("./src/routers/posts"));
const rewards_1 = __importDefault(require("./src/routers/rewards"));
const images_1 = __importDefault(require("./src/routers/images"));
const groups_1 = __importDefault(require("./src/routers/groups"));
const dotenv_1 = require("dotenv");
const challenges_1 = __importDefault(require("./src/routers/challenges"));
(0, dotenv_1.config)();
const server = (0, express_1.default)();
const PORT = process.env.PORT || 3000;
const DB_USERNAME = process.env.DB_USERNAME;
const DB_PWD = process.env.DB_PWD;
const DB_NAME = process.env.DB_NAME;
mongoose_1.default.set("debug", true);
mongoose_1.default.connect(
  `mongodb+srv://${DB_USERNAME}:${DB_PWD}@cluster0.elh3w.mongodb.net/${DB_NAME}?retryWrites=true&w=majority`,
  {
    useUnifiedTopology: true,
    useNewUrlParser: true,
  }
);
server.use((0, express_1.urlencoded)({ extended: true }));
server.use((0, express_1.json)());
server.use(express_1.default.static(`${__dirname}/../public`));
server.use("/users", users_1.default);
server.use("/posts", posts_1.default);
server.use("/rewards", rewards_1.default);
server.use("/images", images_1.default);
server.use("/groups", groups_1.default);
server.use("/challenges", challenges_1.default);
server.listen(PORT, () => console.log(`server is listening on ${PORT}`));
