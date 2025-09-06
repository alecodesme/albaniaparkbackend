import { Park } from "./Park";
import { Store } from "./Store";

export interface StorePark {
    id: string;
    storeId: string;
    parkId: string;

    // Relaciones
    store?: Store;
    park?: Park;
}