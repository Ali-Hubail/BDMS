import express from 'express';
import { getPersons } from '../controllers/user';

const router = express.Router();

router.route('/:id').get(getPersons);
export { router as userRouter}