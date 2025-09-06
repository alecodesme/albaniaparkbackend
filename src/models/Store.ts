import { Owner } from "./Owner";
import { Product } from "./Product";

export interface Store {
    id: string;
    name: string;
    location?: string;
    ownerId: string;
    createdAt: Date;
    updatedAt: Date;

    // Relaciones
    owner?: Owner;
    products?: Product[];
}