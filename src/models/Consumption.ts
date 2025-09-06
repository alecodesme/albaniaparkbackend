import { Member } from "./Member";
import { Pass } from "./Pass";

export interface Consumption {
    id: string;
    passId: string;
    memberId?: string;
    location: string;
    item: string;
    amount: number;
    createdAt: Date;

    // Relaciones
    pass?: Pass;
    member?: Member;
}