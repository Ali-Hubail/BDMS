import {eq } from "drizzle-orm";
import { NextFunction, Request, Response } from "express";
import db from "../db";
import {Disease, disease, person} from "../schema";

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
            const { password, ...rest} = foundPerson!;
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
        console.log(req.params);
        const foundPerson = await db.query.person.findFirst({
            where: eq(person.person_id, id),
            with: {
                disease: true,
            }
            })
            const { password, ...rest} = foundPerson!;  
            res.send(rest);

        }catch(err){
            next(err);
        }
}

export async function getHistory(
    req:Request,
    res:Response,
    next:NextFunction
    ){
        try{
        const { id } = req.params;
        const foundPerson = await db.query.person.findFirst({
            where: eq(person.person_id, id),
            with: {
                request: true,
            }
            })
            const { password, ...rest} = foundPerson!;
            res.send(rest);

        }catch(err){
            next(err);
        }
    }
        

type DiseaseType = Omit<Disease, "disease_id">;

export async function addDisease(
    req:Request,
    res:Response,
    next:NextFunction
    ){
        try{
            const {id} = req.params;
            const newDisease : DiseaseType = {
                disease_name: req.body.disease_name,
                person_id: id
            }
            const addedDisease = await db.insert(disease).values([newDisease]).returning();
            return res.send(addedDisease);
        }catch(err){
            next(err);
        }
}

export async function removeDisease(
    req:Request,
    res:Response,
    next:NextFunction
    ){
        try{
            const {id} = req.params;
            const removedDisease = await db.delete(disease).where(
                eq(disease.disease_id, id)
            ).returning();
            return res.send(removedDisease);
        }catch(err){
            next(err);
        }
}