import { and, eq } from "drizzle-orm";
import { NextFunction, Request, Response } from "express";
import db from "../db";
import {person} from "../schema";

export async function getPerson(
    req:Request,
    res:Response,
    next:NextFunction
    ){
        try{
        const { id } = req.params;
        const foundPerson = await db.query.person.findFirst({
            where: eq(person.person_id, id),
            })
            const { person_id, ...rest} = foundPerson!;
            res.send(rest);

        }catch(err){
            next(err);
        }
}

export async function getDiseases(
    req:Request,
    res:Response,
    next:NextFunction
    ){
        try{
        const { id } = req.params;
        const foundPerson = await db.query.person.findFirst({
            where: eq(person.person_id, id),
            with: {
                disease: true,
            }
            })
            res.send(foundPerson);

        }catch(err){
            next(err);
        }
}
        