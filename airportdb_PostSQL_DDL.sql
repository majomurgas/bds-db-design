
set client_encoding to 'UTF8';

/*
Table structure for table 'public.airline'
*/

DROP TABLE IF EXISTS "public"."airline" CASCADE;
CREATE TABLE "public"."airline" ("airline_id" INTEGER NOT NULL, "airline_name" VARCHAR(45) , "email" VARCHAR(45) , "adress" VARCHAR(45) );
DROP INDEX IF EXISTS "PRIMARY";
ALTER TABLE "public"."airline" ADD CONSTRAINT "PRIMARY" PRIMARY KEY ("airline_id");

/*
Dumping data for table 'public.airline'
*/


/*
Table structure for table 'public.airplane'
*/

DROP TABLE IF EXISTS "public"."airplane" CASCADE;
CREATE TABLE "public"."airplane" ("airplane_id" INTEGER NOT NULL, "model_num" VARCHAR(45) , "airline_id" INTEGER NOT NULL, "airplane_type_id" INTEGER NOT NULL);
DROP INDEX IF EXISTS "PRIMARY00000";
ALTER TABLE "public"."airplane" ADD CONSTRAINT "PRIMARY00000" PRIMARY KEY ("airplane_id");
DROP INDEX IF EXISTS "fk_airplane_airline1_idx";
CREATE INDEX "fk_airplane_airline1_idx" ON "public"."airplane" ("airline_id");
DROP INDEX IF EXISTS "fk_airplane_airplane_type1_idx";
CREATE INDEX "fk_airplane_airplane_type1_idx" ON "public"."airplane" ("airplane_type_id");

/*
Dumping data for table 'public.airplane'
*/


/*
Table structure for table 'public.airplane_type'
*/

DROP TABLE IF EXISTS "public"."airplane_type" CASCADE;
CREATE TABLE "public"."airplane_type" ("type_id" INTEGER NOT NULL, "description" VARCHAR(45) , "identifier" VARCHAR(45) );
DROP INDEX IF EXISTS "PRIMARY00001";
ALTER TABLE "public"."airplane_type" ADD CONSTRAINT "PRIMARY00001" PRIMARY KEY ("type_id");

/*
Dumping data for table 'public.airplane_type'
*/


/*
Table structure for table 'public.airport'
*/

DROP TABLE IF EXISTS "public"."airport" CASCADE;
CREATE TABLE "public"."airport" ("airport_id" INTEGER NOT NULL, "iata" VARCHAR(45) , "icao" VARCHAR(45) , "name" VARCHAR(100) );
DROP INDEX IF EXISTS "PRIMARY00002";
ALTER TABLE "public"."airport" ADD CONSTRAINT "PRIMARY00002" PRIMARY KEY ("airport_id");

/*
Dumping data for table 'public.airport'
*/


/*
Table structure for table 'public.airport_geo'
*/

DROP TABLE IF EXISTS "public"."airport_geo" CASCADE;
CREATE TABLE "public"."airport_geo" ("airpot_id" INTEGER NOT NULL, "name" VARCHAR(45) , "city" VARCHAR(45) , "country" VARCHAR(45));
DROP INDEX IF EXISTS "PRIMARY00003";
ALTER TABLE "public"."airport_geo" ADD CONSTRAINT "PRIMARY00003" PRIMARY KEY ("airpot_id");
DROP INDEX IF EXISTS "fk_airport_geo_airport1_idx";

/*
Dumping data for table 'public.airport_geo'
*/


/*
Table structure for table 'public.boarding_pass'
*/

DROP TABLE IF EXISTS "public"."boarding_pass" CASCADE;
CREATE TABLE "public"."boarding_pass" ("boarding_pass_id" INTEGER NOT NULL, "gate" VARCHAR(45) , "meal" VARCHAR(45) , "baggage" VARCHAR(45) , "flight_id" INTEGER NOT NULL, "passenger_id" INTEGER NOT NULL, "ticket_id" INTEGER NOT NULL);
DROP INDEX IF EXISTS "PRIMARY00004";
ALTER TABLE "public"."boarding_pass" ADD CONSTRAINT "PRIMARY00004" PRIMARY KEY ("boarding_pass_id");
DROP INDEX IF EXISTS "fk_boarding_pass_flight1_idx";
CREATE INDEX "fk_boarding_pass_flight1_idx" ON "public"."boarding_pass" ("flight_id");
DROP INDEX IF EXISTS "fk_boarding_pass_pasenger1_idx";
CREATE INDEX "fk_boarding_pass_pasenger1_idx" ON "public"."boarding_pass" ("passenger_id");
DROP INDEX IF EXISTS "fk_boarding_pass_ticket1_idx";
CREATE INDEX "fk_boarding_pass_ticket1_idx" ON "public"."boarding_pass" ("ticket_id");

/*
Dumping data for table 'public.boarding_pass'
*/


/*
Table structure for table 'public.cabin_crew'
*/

DROP TABLE IF EXISTS "public"."cabin_crew" CASCADE;
CREATE TABLE "public"."cabin_crew" ("cabin_crew_id" INTEGER NOT NULL, "first_name" VARCHAR(45) , "last_name" VARCHAR(45) , "contact_number" VARCHAR(45) , "designation" VARCHAR(45) , "flight_id" INTEGER);
DROP INDEX IF EXISTS "PRIMARY00005";
ALTER TABLE "public"."cabin_crew" ADD CONSTRAINT "PRIMARY00005" PRIMARY KEY ("cabin_crew_id");
DROP INDEX IF EXISTS "flight_id_idx";
CREATE INDEX "flight_id_idx" ON "public"."cabin_crew" ("flight_id");

/*
Dumping data for table 'public.cabin_crew'
*/


/*
Table structure for table 'public.flight'
*/

DROP TABLE IF EXISTS "public"."flight" CASCADE;
CREATE TABLE "public"."flight" ("flight_id" SERIAL NOT NULL, "airline_id" VARCHAR(45) , "airplane_id" VARCHAR(45) , "from" VARCHAR(45) , "to" VARCHAR(45) , "departure" VARCHAR(45) , "arrival" VARCHAR(45));
ALTER SEQUENCE "public"."flight_flight_id_seq" RESTART WITH 1 INCREMENT BY 1;
DROP INDEX IF EXISTS "PRIMARY00006";
ALTER TABLE "public"."flight" ADD CONSTRAINT "PRIMARY00006" PRIMARY KEY ("flight_id");
DROP INDEX IF EXISTS "fk_flight_booking1_idx";

/*
Dumping data for table 'public.flight'
*/


/*
Table structure for table 'public.pasenger'
*/

DROP TABLE IF EXISTS "public"."pasenger" CASCADE;
CREATE TABLE "public"."pasenger" ("passenger_id" INTEGER NOT NULL, "firstname" VARCHAR(45) , "lastname" VARCHAR(45) , "passportnum" INTEGER NOT NULL);
DROP INDEX IF EXISTS "PRIMARY00007";
ALTER TABLE "public"."pasenger" ADD CONSTRAINT "PRIMARY00007" PRIMARY KEY ("passenger_id");


/*
Dumping data for table 'public.pasenger'
*/


/*
Table structure for table 'public.pasenger_has_ticket'
*/

DROP TABLE IF EXISTS "public"."pasenger_has_ticket" CASCADE;
CREATE TABLE "public"."pasenger_has_ticket" ("ticket_id" INTEGER NOT NULL, "passenger_id" INTEGER NOT NULL);
DROP INDEX IF EXISTS "PRIMARY00008";
ALTER TABLE "public"."pasenger_has_ticket" ADD CONSTRAINT "PRIMARY00008" PRIMARY KEY ("ticket_id", "passenger_id");
DROP INDEX IF EXISTS "fk_ticket_has_pasenger_pasenger1_idx";
CREATE INDEX "fk_ticket_has_pasenger_pasenger1_idx" ON "public"."pasenger_has_ticket" ("passenger_id");
DROP INDEX IF EXISTS "fk_ticket_has_pasenger_ticket1_idx";
CREATE INDEX "fk_ticket_has_pasenger_ticket1_idx" ON "public"."pasenger_has_ticket" ("ticket_id");

/*
Dumping data for table 'public.pasenger_has_ticket'
*/


/*
Table structure for table 'public.passenger_details'
*/

DROP TABLE IF EXISTS "public"."passenger_details" CASCADE;
CREATE TABLE "public"."passenger_details" ("passenger_details_id" INTEGER NOT NULL, "birthdate" VARCHAR(45) , "sex" VARCHAR(45) , "phone_num" VARCHAR(45) , "emailadress" VARCHAR(45) , "city" VARCHAR(45) , "country" VARCHAR(45) , "street" VARCHAR(45), "passenger_id" INTEGER NOT NULL);
DROP INDEX IF EXISTS "PRIMARY00009";
ALTER TABLE "public"."passenger_details" ADD CONSTRAINT "PRIMARY00009" PRIMARY KEY ("passenger_details_id");
DROP INDEX IF EXISTS "fk_passenger_details_pasenger1_idx";
CREATE INDEX "fk_passenger_details_pasenger1_idx" ON "public"."passenger_details" ("passenger_id");

/*
Dumping data for table 'public.passenger_details'
*/


/*
Table structure for table 'public.pilot'
*/

DROP TABLE IF EXISTS "public"."pilot" CASCADE;
CREATE TABLE "public"."pilot" ("pilot_id" INTEGER NOT NULL, "first_name" VARCHAR(45) , "last_name" VARCHAR(45) , "contact_number" VARCHAR(45) , "pilotlicense" VARCHAR(45) , "designation" VARCHAR(45) , "flight_id" INTEGER NOT NULL);
DROP INDEX IF EXISTS "PRIMARY00010";
ALTER TABLE "public"."pilot" ADD CONSTRAINT "PRIMARY00010" PRIMARY KEY ("pilot_id");
DROP INDEX IF EXISTS "fk_pilot_flight1_idx";
CREATE INDEX "fk_pilot_flight1_idx" ON "public"."pilot" ("flight_id");

/*
Dumping data for table 'public.pilot'
*/


/*
Table structure for table 'public.ticket'
*/

DROP TABLE IF EXISTS "public"."ticket" CASCADE;
CREATE TABLE "public"."ticket" ("ticket_id" INTEGER NOT NULL, "from" VARCHAR(45) , "to" VARCHAR(45) , "currency" VARCHAR(45) , "invoice_num" INTEGER);
DROP INDEX IF EXISTS "PRIMARY00011";
ALTER TABLE "public"."ticket" ADD CONSTRAINT "PRIMARY00011" PRIMARY KEY ("ticket_id");

/*
Dumping data for table 'public.ticket'
*/


DROP TABLE IF EXISTS "public"."cabin_crew" CASCADE;
CREATE TABLE "public"."cabin_crew" ("cabin_crew_id" INTEGER NOT NULL, "first_name" VARCHAR(45) , "last_name" VARCHAR(45) , "contact_number" VARCHAR(45) , "designation" VARCHAR(45) , "flight_id" INTEGER);
DROP INDEX IF EXISTS "PRIMARY00005";
ALTER TABLE "public"."cabin_crew" ADD CONSTRAINT "PRIMARY00005" PRIMARY KEY ("cabin_crew_id");
DROP INDEX IF EXISTS "flight_id_idx";
CREATE INDEX "flight_id_idx" ON "public"."cabin_crew" ("flight_id");

/*
Dumping data for table 'public.cabin_crew'
*/


/*
Table structure for table 'public.flight'
*/

DROP TABLE IF EXISTS "public"."flight" CASCADE;
CREATE TABLE "public"."flight" ("flight_id" SERIAL NOT NULL, "airline_id" VARCHAR(45) , "airplane_id" VARCHAR(45) , "from" VARCHAR(45) , "to" VARCHAR(45) , "departure" DATETIME , "arrival" DATETIME);
ALTER SEQUENCE "public"."flight_flight_id_seq" RESTART WITH 1 INCREMENT BY 1;
DROP INDEX IF EXISTS "PRIMARY00006";
ALTER TABLE "public"."flight" ADD CONSTRAINT "PRIMARY00006" PRIMARY KEY ("flight_id");
DROP INDEX IF EXISTS "fk_flight_booking1_idx";

/*
Dumping data for table 'public.flight'
*/


/*
Table structure for table 'public.pasenger'
*/

DROP TABLE IF EXISTS "public"."pasenger" CASCADE;
CREATE TABLE "public"."pasenger" ("passenger_id" INTEGER NOT NULL, "firstname" VARCHAR(45) , "lastname" VARCHAR(45) , "passportnum" INTEGER NOT NULL);
DROP INDEX IF EXISTS "PRIMARY00007";
ALTER TABLE "public"."pasenger" ADD CONSTRAINT "PRIMARY00007" PRIMARY KEY ("passenger_id");


/*
Dumping data for table 'public.pasenger'
*/


/*
Table structure for table 'public.pasenger_has_ticket'
*/

DROP TABLE IF EXISTS "public"."pasenger_has_ticket" CASCADE;
CREATE TABLE "public"."pasenger_has_ticket" ("ticket_id" INTEGER NOT NULL, "passenger_id" INTEGER NOT NULL);
DROP INDEX IF EXISTS "PRIMARY00008";
ALTER TABLE "public"."pasenger_has_ticket" ADD CONSTRAINT "PRIMARY00008" PRIMARY KEY ("ticket_id", "passenger_id");
DROP INDEX IF EXISTS "fk_ticket_has_pasenger_pasenger1_idx";
CREATE INDEX "fk_ticket_has_pasenger_pasenger1_idx" ON "public"."pasenger_has_ticket" ("passenger_id");
DROP INDEX IF EXISTS "fk_ticket_has_pasenger_ticket1_idx";
CREATE INDEX "fk_ticket_has_pasenger_ticket1_idx" ON "public"."pasenger_has_ticket" ("ticket_id");

/*
Dumping data for table 'public.pasenger_has_ticket'
*/


/*
Table structure for table 'public.passenger_details'
*/

DROP TABLE IF EXISTS "public"."passenger_details" CASCADE;
CREATE TABLE "public"."passenger_details" ("passenger_details_id" INTEGER NOT NULL, "birthdate" VARCHAR(45) , "sex" VARCHAR(45) , "phone_num" VARCHAR(45) , "emailadress" VARCHAR(45) , "city" VARCHAR(45) , "country" VARCHAR(45) , "street" INTEGER, "passenger_id" INTEGER NOT NULL);
DROP INDEX IF EXISTS "PRIMARY00009";
ALTER TABLE "public"."passenger_details" ADD CONSTRAINT "PRIMARY00009" PRIMARY KEY ("passenger_details_id");
DROP INDEX IF EXISTS "fk_passenger_details_pasenger1_idx";
CREATE INDEX "fk_passenger_details_pasenger1_idx" ON "public"."passenger_details" ("passenger_id");

/*
Dumping data for table 'public.passenger_details'
*/


/*
Table structure for table 'public.pilot'
*/

DROP TABLE IF EXISTS "public"."pilot" CASCADE;
CREATE TABLE "public"."pilot" ("pilot_id" INTEGER NOT NULL, "first_name" VARCHAR(45) , "last_name" VARCHAR(45) , "contact_number" VARCHAR(45) , "pilotlicense" VARCHAR(45) , "designation" VARCHAR(45) , "flight_id" INTEGER NOT NULL);
DROP INDEX IF EXISTS "PRIMARY00010";
ALTER TABLE "public"."pilot" ADD CONSTRAINT "PRIMARY00010" PRIMARY KEY ("pilot_id");
DROP INDEX IF EXISTS "fk_pilot_flight1_idx";
CREATE INDEX "fk_pilot_flight1_idx" ON "public"."pilot" ("flight_id");

/*
Dumping data for table 'public.pilot'
*/


/*
Table structure for table 'public.ticket'
*/

DROP TABLE IF EXISTS "public"."ticket" CASCADE;
CREATE TABLE "public"."ticket" ("ticket_id" INTEGER NOT NULL, "from" VARCHAR(45) , "to" VARCHAR(45) , "currency" VARCHAR(45) , "invoice_num" INTEGER);
DROP INDEX IF EXISTS "PRIMARY00011";
ALTER TABLE "public"."ticket" ADD CONSTRAINT "PRIMARY00011" PRIMARY KEY ("ticket_id");

/*
Dumping data for table 'public.ticket'
*/


