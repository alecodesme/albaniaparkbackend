import { Consumption } from "./Consumption";
import { Member } from "./Member";
import { Park } from "./Park";

export type PassType = "GROUP" | "INDIVIDUAL";

export interface Pass {
    id: string;
    type: PassType;
    qrCode: string;
    credits: number;
    parkId: string;
    validDate: Date;
    createdAt: Date;
    updatedAt: Date;

    // Relaciones
    members?: Member[];
    consumptions?: Consumption[];
    park?: Park;
}