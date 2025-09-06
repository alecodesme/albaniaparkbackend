import { CreateParkDTO } from "../dtos/requests/park.request";
import prisma from "../utils/prisma";

export const Park = {
    create: (data: CreateParkDTO) => prisma.park.create({ data }),
    findAll: () => prisma.park.findMany(),
    findById: (id: string) => prisma.park.findUnique({ where: { id } }),
    update: (id: string, data: any) => prisma.park.update({ where: { id }, data }),
    delete: (id: string) => prisma.park.delete({ where: { id } }),
};