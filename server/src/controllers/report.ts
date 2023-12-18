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
            const bloodDonation = await db.select({
                blood_group: blood.blood_group,
                quantity: blood.quantity,
                expiration_date: blood.expiration_date,
        }).from(blood)

        const byBlood = await db.select({
            blood_group: blood.blood_group,
            sum: sql<number>`sum(${blood.quantity})`,
            count: sql<number>`count(*)`,
        }).from(blood).groupBy(blood.blood_group).orderBy(blood.blood_group)

        // const dontations = {
        //     totals: bloodDonation.reduce((acc, curr) => {
        //         acc.sum += curr.sum;
        //         acc.count += Number(curr.count);
        //         return acc;
        //     }, {sum: 0, count: 0}),
        //     byBloodGroup: bloodDonation
        // }
           
            return res.send({byBlood, bloodDonation});
        }catch(err){
            next(err);
        }
}   

