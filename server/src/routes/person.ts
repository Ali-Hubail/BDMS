import express from 'express';
import { addDisease, getDiseases, getHistory, getPerson, removeDisease, sendRequest, updatePersonalInformation } from '../controllers/person';

const router = express.Router();

router.route('/').get(getDiseases)
router.route('/send').post(sendRequest)
router.route('/:id').get(getPerson).patch(updatePersonalInformation);
router.route('/history/:id').get(getHistory)
router.route('/disease/:id').get(getDiseases).post(addDisease).delete(removeDisease);




export { router as personRouter}