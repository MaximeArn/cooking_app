import { Router } from "express";
const userRouter = Router();

userRouter.post("/", (_, res) => {
  res.send("add user !");
});

export default userRouter;
