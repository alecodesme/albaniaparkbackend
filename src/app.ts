import express from 'express';
import { errorHandler } from './middlewares/errorHandler';
import parkRouter from './routes/park.router';

const app = express();

app.use(express.json());

app.use("/api/parks", parkRouter);

// Global error handler (should be after routes)
app.use(errorHandler);

export default app;