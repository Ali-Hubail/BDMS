DO $$ BEGIN
 CREATE TYPE "blood_types" AS ENUM('A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-');
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 CREATE TYPE "role" AS ENUM('admin', 'user');
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "blood" (
	"dontation_id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"expiration_date" date NOT NULL,
	"blood_group" "blood_types" NOT NULL,
	"bigint" bigint NOT NULL,
	"donor_id" uuid
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "blood_bank" (
	"bldbank_id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"name" varchar(255) NOT NULL,
	"address" varchar(255) NOT NULL,
	"bigint" bigint NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "communicates" (
	"communicates_id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"donor_id" uuid,
	"recipient_id" uuid
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "disease" (
	"disease_id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"disease_name" varchar(255) NOT NULL,
	"person_id" uuid NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "donor" (
	"donor_id" uuid PRIMARY KEY NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "hospital" (
	"hospital_id" uuid PRIMARY KEY NOT NULL,
	"name" varchar(255) NOT NULL,
	"address" varchar(255) NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "manager" (
	"manager_id" uuid PRIMARY KEY NOT NULL,
	"name" varchar(255) NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "person" (
	"person_id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"name" varchar(255) NOT NULL,
	"email" varchar(255) NOT NULL,
	"age" bigint NOT NULL,
	"weight" bigint NOT NULL,
	"contact_number" varchar(12) NOT NULL,
	"role" "role" NOT NULL,
	"blood_group" "blood_types" NOT NULL,
	"address" varchar(255) NOT NULL,
	"password" varchar(255) NOT NULL,
	CONSTRAINT "person_email_unique" UNIQUE("email")
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "recipient" (
	"recipient_id" uuid PRIMARY KEY NOT NULL
);
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "blood" ADD CONSTRAINT "blood_donor_id_person_person_id_fk" FOREIGN KEY ("donor_id") REFERENCES "person"("person_id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "communicates" ADD CONSTRAINT "communicates_donor_id_person_person_id_fk" FOREIGN KEY ("donor_id") REFERENCES "person"("person_id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "communicates" ADD CONSTRAINT "communicates_recipient_id_person_person_id_fk" FOREIGN KEY ("recipient_id") REFERENCES "person"("person_id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "disease" ADD CONSTRAINT "disease_person_id_person_person_id_fk" FOREIGN KEY ("person_id") REFERENCES "person"("person_id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "donor" ADD CONSTRAINT "donor_donor_id_person_person_id_fk" FOREIGN KEY ("donor_id") REFERENCES "person"("person_id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "manager" ADD CONSTRAINT "manager_manager_id_person_person_id_fk" FOREIGN KEY ("manager_id") REFERENCES "person"("person_id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "recipient" ADD CONSTRAINT "recipient_recipient_id_person_person_id_fk" FOREIGN KEY ("recipient_id") REFERENCES "person"("person_id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
