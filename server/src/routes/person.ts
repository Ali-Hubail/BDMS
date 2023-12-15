import express from 'express';
import { getDiseases, getPerson } from '../controllers/person';

const router = express.Router();

router.route('/d/:id').get(getDiseases)
router.route('/:id').get(getPerson)


export { router as personRouter}