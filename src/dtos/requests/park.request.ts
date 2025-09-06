import { IsNotEmpty } from "class-validator";

export class CreateParkDTO {
    @IsNotEmpty({ message: "El nombre del parque es obligatorio" })
    name!: string;

    @IsNotEmpty({ message: "La ubicación debe es obligatorio" })
    location!: string
}