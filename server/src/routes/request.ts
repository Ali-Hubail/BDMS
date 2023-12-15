import express from 'express';
import { approveRequest, getRequests } from '../controllers/request';

const router = express.Router();
router.get('/', getRequests);
router.patch('/:id', approveRequest);
export { router as requestRouter}