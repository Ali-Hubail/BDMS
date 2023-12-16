import express from 'express';
import { approveRequest, getRequests, rejectRequest } from '../controllers/request';

const router = express.Router();
router.get('/', getRequests);
router.patch('/:id', approveRequest).delete('/:id', rejectRequest);
export { router as requestRouter}