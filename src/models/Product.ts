import { Store } from "./Store";

export interface Product {
    id: string;
    name: string;
    credits: number;
    stock: number;
    category?: string;
    storeId: string;
    createdAt: Date;
    updatedAt: Date;

    // Relaciones
    store?: Store;
}