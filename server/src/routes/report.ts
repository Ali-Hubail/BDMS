import express from 'express';
import { getBloodDonations } from '../controllers/report';

const router = express.Router();

router.route("/").get(getBloodDonations);

export {router as reportRouter}