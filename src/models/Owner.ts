import { Store } from "./Store";

export interface Owner {
    id: string;
    name: string;
    email: string;
    phone?: string;
    createdAt: Date;
    updatedAt: Date;

    // Relaciones
    stores?: Store[];
}