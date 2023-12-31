import { InferModel, relations, sql } from "drizzle-orm";
import {
  bigint,
  doublePrecision as float,
  boolean,
  date,
  pgEnum,
  pgTable,
  uuid,
  varchar,
} from "drizzle-orm/pg-core";

export const roleEnum = pgEnum("role", ["admin", "user"]);
export const blood_types = pgEnum("blood_types", ["A+", "A-", "B+", "B-", "AB+", "AB-", "O+", "O-"]);
export const request_types = pgEnum("request_types", ["donation", "receiving"]);

export const person = pgTable("person", {
    person_id: uuid("person_id").primaryKey().default(sql`gen_random_uuid()`),
    name: varchar("name", {length: 255}).notNull(),
    email: varchar("email", {length: 255}).notNull().unique(),
    age: bigint('age', { mode: 'number' }).notNull(),
    weight: float('weight').notNull(),
    contact_number: varchar('contact_number', { length: 12 }).notNull(),
    role: roleEnum('role').notNull(),
    blood_group: blood_types('blood_group').notNull(),
    address: varchar('address', { length: 255 }).notNull(),
    password: varchar('password', { length: 255 }).notNull(),  
    });
export const donor = pgTable("donor", {
    donor_id: uuid("donor_id").primaryKey().references(()=>person.person_id),
    }); 
export const recipient = pgTable("recipient", {
        recipient_id: uuid("recipient_id").primaryKey().references(()=>person.person_id),
        }); 

export const blood = pgTable("blood", {
    dontation_id: uuid("dontation_id").primaryKey().default(sql`gen_random_uuid()`),    
    expiration_date: date("expiration_date").notNull(),
    blood_group: blood_types('blood_group').notNull(),
    quantity: bigint('quantity', { mode: 'number' }).notNull(),
    donor_id: uuid("donor_id").references(()=>person.person_id),
    blood_bank_id: uuid("blood_bank_id").references(()=>blood_bank.bldbank_id),
    });

export const blood_bank = pgTable("blood_bank", {
        bldbank_id: uuid("bldbank_id").primaryKey().default(sql`gen_random_uuid()`),
        name: varchar("name", {length: 255}).notNull(),
        location: varchar('address', { length: 255 }).notNull(),
        quantity: bigint('quantity', { mode: 'number' }).notNull(),
        });
export const manager = pgTable("manager", {
    manager_id: uuid("manager_id").primaryKey().references(()=>person.person_id),
    name: varchar("name", {length: 255}).notNull(),
    });
    export const hospital = pgTable("hospital", {
        hospital_id: uuid("hospital_id").primaryKey(),
        name: varchar("name", {length: 255}).notNull(),
        location: varchar('address', { length: 255 }).notNull(),
        });
export const communicates = pgTable("communicates", {
        communicates_id: uuid("communicates_id").primaryKey().default(sql`gen_random_uuid()`),
        manager_id: uuid("donor_id").references(()=>person.person_id),
        hospital_id: uuid("recipient_id").references(()=>person.person_id),
        });
export const disease = pgTable("disease", {
        disease_id: uuid("disease_id").primaryKey().default(sql`gen_random_uuid()`),
        disease_name: varchar("disease_name", {length: 255}).notNull(),
        person_id: uuid("person_id").references(()=>person.person_id).notNull(),
    });

export const donorBloodRelation = relations(donor, ({many})=>({
    blood: many(blood)
}))

export const bloodBankBloodRelation = relations(blood_bank, ({many})=>({
    blood: many(blood),
    request: many(requestTable)
}))
export const managerCommunicatesRelation = relations(manager, ({many})=>({ 
    communicates: many(communicates)
}))
export const hospitalCommunicatesRelation = relations(hospital, ({many})=>({ 
    communicates: many(communicates)
}))
export const personDiseaseRelation = relations(person, ({many})=>({ 
    disease: many(disease),
    request: many(requestTable)
}))
export const diseasePersonRelation = relations(disease, ({one})=>({
    person: one(person, {
        fields: [disease.person_id],
        references: [person.person_id],
}),
}));
export const recipientBloodBankRelation = relations(recipient, ({many})=>({
    blood_bank: many(blood_bank)
}))
export const managerBloodBankRelation = relations(manager, ({one})=>({
    blood_bank: one(blood_bank)
}))
export const requestTable= pgTable("request", {
    request_id: uuid("request_id").primaryKey().default(sql`gen_random_uuid()`),
    request_type: request_types('request_type').notNull(),
    blood_group: blood_types('blood_group').notNull(),
    quantity: bigint('quantity', { mode: 'number' }).notNull(),
    blood_bank_id: uuid("blood_bank_id").references(()=>blood_bank.bldbank_id),
    request_status: boolean('request_status').notNull(),
    sent_by: uuid("sent_by").references(()=>person.person_id),
    request_date: date("request_date").notNull(),
    });

export const requestBloodBankRelation = relations(requestTable, ({one})=>({
    blood_bank: one(blood_bank)
}))
export const requestPersonRelation = relations(person, ({many})=>({
    request: many(requestTable), disease: many(disease)
}))

export const personRequestRelation = relations(requestTable, ({one})=>({
    person: one(person, {
        fields: [requestTable.sent_by],
        references: [person.person_id],
}),
}));

export type Person = InferModel<typeof person>;
export type Donor = InferModel<typeof donor>;
export type Recipient = InferModel<typeof recipient>;
export type Blood = InferModel<typeof blood>;
export type Blood_bank = InferModel<typeof blood_bank>;
export type Manager = InferModel<typeof manager>;
export type Hospital = InferModel<typeof hospital>;
export type Communicates = InferModel<typeof communicates>;
export type Disease = InferModel<typeof disease>;
export type RequestType = InferModel<typeof requestTable>;

