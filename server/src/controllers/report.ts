import { eq, sql } from "drizzle-orm";
import  { NextFunction, Request, Response } from "express";
import db from "../db";
import {blood} from "../schema";

export async function getBloodDonations(
    req:Request,
    res:Response,
    next:NextFunction
    ){
        try{
            const {id} = req.params;
            const bloodDonation = db.select({
                dontation_id: blood.dontation_id,
                blood_group: blood.blood_group,
                quantity: blood.quantity,
                sum: sql<number>`cast(sum(${blood.quantity}) as int)`,
            }).from(blood).where(eq(blood.blood_bank_id, id)).groupBy(blood.blood_group)
           
            return res.send(bloodDonation);
        }catch(err){
            next(err);
        }
}   