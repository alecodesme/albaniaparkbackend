import { Consumption } from "./Consumption";
import { Pass } from "./Pass";

export type PersonType = "BEBE" | "NINO" | "JOVEN" | "ADULTO" | "TERCERA_EDAD";

export interface Member {
    id: string;
    firstName: string;
    lastName: string;
    birthDate: Date;
    nationality: string;
    personType: PersonType;
    passId: string;

    // Relaciones
    pass?: Pass;
    consumptions?: Consumption[];
}