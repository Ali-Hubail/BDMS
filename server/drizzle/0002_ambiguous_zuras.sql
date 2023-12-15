ALTER TABLE "blood" RENAME COLUMN "bigint" TO "quantity";--> statement-breakpoint
ALTER TABLE "blood_bank" RENAME COLUMN "bigint" TO "quantity";--> statement-breakpoint
ALTER TABLE "blood" ADD COLUMN "blood_bank_id" uuid;--> statement-breakpoint
ALTER TABLE "request" ADD COLUMN "blood_bank_id" uuid;--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "blood" ADD CONSTRAINT "blood_blood_bank_id_blood_bank_bldbank_id_fk" FOREIGN KEY ("blood_bank_id") REFERENCES "blood_bank"("bldbank_id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "request" ADD CONSTRAINT "request_blood_bank_id_blood_bank_bldbank_id_fk" FOREIGN KEY ("blood_bank_id") REFERENCES "blood_bank"("bldbank_id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
