import { Request, Response } from "express";
import { ParkService } from "../services/park.service";
import { CreateParkErrorResponse, CreateParkResponse, GetAllParksErrorResponse, GetAllParksResponse } from "../dtos/responses/park.response";


const parkService = new ParkService();

export class ParkController {
    async create(req: Request, res: Response<CreateParkResponse | CreateParkErrorResponse>) {
        try {
            const user = await parkService.createPark(req.body);
            return res.status(201).json({
                success: true,
                message: "Park created",
                data: user,
            });
        } catch (err: any) {
            return res.status(400).json({ success: false, message: err.message });
        }
    }
    async findAll(_req: Request, res: Response<GetAllParksResponse | GetAllParksErrorResponse>) {
        try {
            const parks = await parkService.getAllParks();
            return res.json({ success: true, message: "Parks retrieved", data: parks });
        } catch (err: any) {
            return res.status(400).json({ success: false, message: err.message });
        }
    }
}