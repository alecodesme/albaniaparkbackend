import { plainToInstance } from "class-transformer";
import { validate, ValidationError } from "class-validator";
import { Request, Response, NextFunction } from "express";

// Aquí restringimos T a ser un object
export function validationMiddleware<T extends object>(type: new () => T) {
    return async (req: Request, res: Response, next: NextFunction) => {
        const dto = plainToInstance(type, req.body);

        const errors: ValidationError[] = await validate(dto); // ✅ ahora no da error

        if (errors.length > 0) {
            const messages: string[] = [];
            errors.forEach(err => {
                if (err.constraints) {
                    messages.push(...Object.values(err.constraints));
                }
            });

            return res.status(400).json({
                success: false,
                message: "Validation failed",
                errors: messages,
            });
        }

        next();
    };
}
