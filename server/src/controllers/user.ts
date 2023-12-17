import { and, eq } from "drizzle-orm";
import { NextFunction, Request, Response } from "express";
import db from "../db";
import {person} from "../schema";

export async function getPersons(
    req:Request,
    res:Response,
    next:NextFunction
    ){
        try{
            const persons = await db.query.person.findMany({
                where: and(
                    eq(person.role, "user")
                ),
                columns: {
                    person_id: true,
                    name: true,
                    email: true,
                    age: true,
                    weight: true,
                    contact_number: true,
                    blood_group: true,
                    address: true
                },
                with: {
                    disease: true,
                    request: true
                }
            });
            return res.send(persons);
        }catch(err){
            next(err);
        }
}

export async function deletePerson(
    req:Request,
    res:Response,
    next:NextFunction
    ){
        try{
            const {id} = req.params;
            const deletedPerson = await db.delete(person).where(
                eq(person.person_id, id)
            ).returning();
            return res.send(deletedPerson);
        }catch(err){
            next(err);
        }
    }
