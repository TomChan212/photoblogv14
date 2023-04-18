-- H2 2.1.214;
SET
DB_CLOSE_DELAY -1;
;
CREATE
USER IF NOT EXISTS "SA" SALT ''61de4ec7c3471d9f'' HASH ''cb259ce541617a2756752482f8cafc91fb243b4cce6011ae7c1d72751f458c39'' ADMIN;
CREATE SEQUENCE "PUBLIC"."HIBERNATE_SEQUENCE" START WITH 1 RESTART WITH 289;
CREATE
CACHED TABLE "PUBLIC"."COMMENT"(
    "ID" BIGINT GENERATED BY DEFAULT AS IDENTITY(START WITH 1 RESTART WITH 449) NOT NULL,
    "CREATED_AT" TIMESTAMP,
    "TEXT" CHARACTER VARYING(255),
    "UPDATED_AT" TIMESTAMP,
    "PHOTO_ID" BIGINT,
    "USER_ID" BIGINT
);
ALTER TABLE "PUBLIC"."COMMENT"
    ADD CONSTRAINT "PUBLIC"."CONSTRAINT_6" PRIMARY KEY ("ID");
-- SELECT COUNT(*) FROM PUBLIC.COMMENT;
CREATE
CACHED TABLE "PUBLIC"."COMMENTHISTORY"(
    "ID" BIGINT GENERATED BY DEFAULT AS IDENTITY(START WITH 1 RESTART WITH 449) NOT NULL,
    "CREATED_AT" TIMESTAMP,
    "TEXT" CHARACTER VARYING(255),
    "UPDATED_AT" TIMESTAMP,
    "USER_ID" BIGINT
);
ALTER TABLE "PUBLIC"."COMMENTHISTORY"
    ADD CONSTRAINT "PUBLIC"."CONSTRAINT_4" PRIMARY KEY ("ID");
-- SELECT COUNT(*) FROM PUBLIC.COMMENTHISTORY;
CREATE
CACHED TABLE "PUBLIC"."PHOTO"(
    "ID" BIGINT NOT NULL,
    "DESCRIPTION" CHARACTER VARYING(255) NOT NULL,
    "IMAGE" CHARACTER VARYING(255),
    "TITLE" CHARACTER VARYING(255) NOT NULL,
    "UPLOAD_DATE_TIME" TIMESTAMP NOT NULL,
    "USERS_ID" BIGINT
);
ALTER TABLE "PUBLIC"."PHOTO"
    ADD CONSTRAINT "PUBLIC"."CONSTRAINT_48" PRIMARY KEY ("ID");
-- SELECT COUNT(*) FROM PUBLIC.PHOTO;
CREATE
CACHED TABLE "PUBLIC"."PHOTOHISTORY"(
    "ID" BIGINT NOT NULL,
    "DESCRIPTION" CHARACTER VARYING(255) NOT NULL,
    "IMAGE" CHARACTER VARYING(255),
    "TITLE" CHARACTER VARYING(255) NOT NULL,
    "UPLOAD_DATE_TIME" TIMESTAMP NOT NULL,
    "USERS_ID" BIGINT
);
ALTER TABLE "PUBLIC"."PHOTOHISTORY"
    ADD CONSTRAINT "PUBLIC"."CONSTRAINT_C" PRIMARY KEY ("ID");
-- SELECT COUNT(*) FROM PUBLIC.PHOTOHISTORY;
CREATE
CACHED TABLE "PUBLIC"."USERS"(
    "ID" BIGINT GENERATED BY DEFAULT AS IDENTITY(START WITH 1 RESTART WITH 161) NOT NULL,
    "BIO" CHARACTER VARYING(255),
    "EMAIL" CHARACTER VARYING(255) NOT NULL,
    "PASSWORD" CHARACTER VARYING(255) NOT NULL,
    "PHONE_NUMBER" CHARACTER VARYING(255) NOT NULL,
    "ROLE" CHARACTER VARYING(255) NOT NULL,
    "USERNAME" CHARACTER VARYING(255) NOT NULL
);
ALTER TABLE "PUBLIC"."USERS"
    ADD CONSTRAINT "PUBLIC"."CONSTRAINT_4D" PRIMARY KEY ("ID");
-- SELECT COUNT(*) FROM PUBLIC.USERS;
ALTER TABLE "PUBLIC"."USERS"
    ADD CONSTRAINT "PUBLIC"."UK_R43AF9AP4EDM43MMTQ01ODDJ6" UNIQUE ("USERNAME");
ALTER TABLE "PUBLIC"."COMMENTHISTORY"
    ADD CONSTRAINT "PUBLIC"."FKBJQ0912OIF3Q5HWATUEG8IPHJ" FOREIGN KEY ("USER_ID") REFERENCES "PUBLIC"."USERS" ("ID") NOCHECK;
ALTER TABLE "PUBLIC"."COMMENT"
    ADD CONSTRAINT "PUBLIC"."FKQM52P1V3O13HY268HE0WCNGR5" FOREIGN KEY ("USER_ID") REFERENCES "PUBLIC"."USERS" ("ID") NOCHECK;
ALTER TABLE "PUBLIC"."COMMENT"
    ADD CONSTRAINT "PUBLIC"."FK6I6P8DTFC155JDRDWY8FMSXE2" FOREIGN KEY ("PHOTO_ID") REFERENCES "PUBLIC"."PHOTO" ("ID") NOCHECK;
ALTER TABLE "PUBLIC"."PHOTO"
    ADD CONSTRAINT "PUBLIC"."FKMQGP6YBDFHJ26Y2LQV05OGQFN" FOREIGN KEY ("USERS_ID") REFERENCES "PUBLIC"."USERS" ("ID") NOCHECK;
ALTER TABLE "PUBLIC"."PHOTOHISTORY"
    ADD CONSTRAINT "PUBLIC"."FK9L4NOXXEG00DG7FBRLJ9XGRRT" FOREIGN KEY ("USERS_ID") REFERENCES "PUBLIC"."USERS" ("ID") NOCHECK;