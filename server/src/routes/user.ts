import express from 'express';
import { deletePerson, getPersons } from '../controllers/user';

const router = express.Router();

router.route('/').get(getPersons);
router.route('/:id').delete(deletePerson);
export { router as userRouter}