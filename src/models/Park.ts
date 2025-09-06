import { Pass } from "./Pass";

export interface Park {
    id?: number;
    name: string;
    location: string;
    createdAt?: Date;
    updatedAt?: Date;

    passes?: Pass[];
}