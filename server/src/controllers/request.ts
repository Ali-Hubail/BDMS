import { and, eq } from "drizzle-orm";
import { NextFunction, Request, Response } from "express";
import db from "../db";
import {blood, requestTable} from "../schema";

export async function getRequests(
    req:Request,
    res:Response,
    next:NextFunction
    ){
        try{
            const requests = await db.query.requestTable.findMany({
                where: and(
                    eq(requestTable.request_status, false)
                )
            });
            return res.send(requests);
        }catch(err){
            next(err);
        }
}  

export async function approveRequest(
    req:Request,
    res:Response,
    next:NextFunction
    ){
        try{
            const {id} = req.params;
            const updatedRequest = await db.update(requestTable).set({
                request_status: true
            }).where(
                eq(requestTable.request_id, id)
            ).returning();
            const date = new Date(updatedRequest[0].request_date);
            date.setFullYear(date.getFullYear() + 1);
            if(updatedRequest[0].request_type === "donation"){
            const bloodInsertion = await db.insert(blood).values([{
                expiration_date: date.toISOString(),
                blood_group: updatedRequest[0].blood_group,
                quantity: updatedRequest[0].quantity,
                blood_bank_id: updatedRequest[0].blood_bank_id,
                donor_id: updatedRequest[0].sent_by
            }]).returning();
        }
            return res.send(updatedRequest);
        }catch(err){
            next(err);
        }
    }

    export async function getUserApprovedRequests(
        req:Request,
        res:Response,
        next:NextFunction
        ){
            try{
                const {id} = req.params;
                const requests = await db.query.requestTable.findMany({
                    where: and(
                        eq(requestTable.sent_by, id),
                        eq(requestTable.request_status, true)
                    )
                });
                return res.send(requests);
            }catch(err){
                next(err);
            }
    }
    
