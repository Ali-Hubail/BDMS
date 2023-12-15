DO $$ BEGIN
 CREATE TYPE "request_types" AS ENUM('donation', 'receiving');
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "request" (
	"request_id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"request_type" "request_types" NOT NULL,
	"blood_group" "blood_types" NOT NULL,
	"quantity" bigint NOT NULL,
	"request_status" boolean NOT NULL,
	"sent_by" uuid
);
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "request" ADD CONSTRAINT "request_sent_by_person_person_id_fk" FOREIGN KEY ("sent_by") REFERENCES "person"("person_id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
