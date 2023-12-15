import express from 'express';
import { addDisease, getDiseases, getPerson, removeDisease } from '../controllers/person';

const router = express.Router();

router.route('/').get(getDiseases)
router.route('/:id').get(getPerson)
router.route('/disease/:id').get(getDiseases).post(addDisease).delete(removeDisease);




export { router as personRouter}