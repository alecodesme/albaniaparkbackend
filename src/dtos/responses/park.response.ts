import { Park } from "@prisma/client";

export interface CreateParkResponse {
    success: boolean;
    message: string;
    data: Park;
}
export interface CreateParkErrorResponse {
    success: false;
    message: string;
    errorCode?: string;
}

// Obtener todos los Parks
export interface GetAllParksResponse {
    success: true;
    message: string;
    data: Park[];
}
export interface GetAllParksErrorResponse {
    success: false;
    message: string;
    errorCode?: string;
}

// Obtener un Park por ID
export interface GetParkResponse {
    success: true;
    message: string;
    data: Park;
}
export interface GetParkErrorResponse {
    success: false;
    message: string;
    errorCode?: string;
}

// Actualizar Park
export interface UpdateParkResponse {
    success: true;
    message: string;
    data: Park;
}
export interface UpdateParkErrorResponse {
    success: false;
    message: string;
    errorCode?: string;
}

// Eliminar Park
export interface DeleteParkResponse {
    success: true;
    message: string;
}
export interface DeleteParkErrorResponse {
    success: false;
    message: string;
    errorCode?: string;
}