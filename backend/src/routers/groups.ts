import { Router } from "express";

const groupsRouter = Router();

groupsRouter.post("/:id", (req, res, next) => {
  console.log(req.body);
  console.log(req.params.id);
  res.end();
});

export default groupsRouter;
