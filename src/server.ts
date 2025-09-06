import app from './app';
import config from './config/config';
import { connectDB } from './utils/prisma';

(async () => {
    await connectDB();

    app.listen(config.port, () => {
        console.log(`🚀 Servidor corriendo en http://localhost:${config.port}`);
    });
})();