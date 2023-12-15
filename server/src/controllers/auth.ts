import { and, eq } from "drizzle-orm";
import { NextFunction, Request, Response } from "express";
import db from "../db";
import {person, Person} from "../schema";
import bcrypt from "bcrypt";

type PersonType = Omit<Person, "person_id">;


export async function signUp(
    req:Request,
    res:Response,
    next:NextFunction
    ){
        try{
            const encryptedPassword = bcrypt.hashSync(req.body.password, 10);
            const newUser : PersonType= {
                name: req.body.name,
                email: req.body.email,
                age: req.body.age,
                weight: req.body.weight,
                contact_number: req.body.contact_number,
                role: "user",
                blood_group: req.body.blood_group,
                address: req.body.address,
                password: encryptedPassword,
        }
        const addedPerson = await db.insert(person).values([newUser]).returning();
        return res.send(addedPerson);
        }catch(err){
            next(err);
        }
}

export async function login(
    req:Request,
    res:Response,
    next:NextFunction
    ){
        try{
            const {email, password} = req.body;
            const foundPerson = await db.query.person.findFirst({
                where: and(
                    eq(person.email, email),
                )
            })
            if(foundPerson){
                const isPasswordCorrect = bcrypt.compareSync(password, foundPerson.password);
                if(isPasswordCorrect){
                    res.send(foundPerson);
                }

            }else{
                return res.status(404).send("User not found");
            }
        }catch(err){
            next(err);
        }
}