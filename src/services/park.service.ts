import { CreateParkDTO } from "../dtos/requests/park.request";
import prisma from "../utils/prisma";

export class ParkService {
    async createPark(data: CreateParkDTO) {
        return prisma.park.create({ data })
    }
    async getAllParks() {
        return prisma.park.findMany()
    }
}