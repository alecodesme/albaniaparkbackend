import { Router } from "express";
import { CreateParkDTO } from "../dtos/requests/park.request";
import { ParkController } from "../controllers/park.controller";
import { validationMiddleware } from "../middlewares/validateDto";

const parkRouter = Router();
const parkController = new ParkController()
parkRouter.post("/", validationMiddleware(CreateParkDTO), (req, res) => parkController.create(req, res));
parkRouter.get("/", (req, res) => parkController.findAll(req, res));

export default parkRouter;