BEGIN;

--
-- ACTION DROP TABLE
--
DROP TABLE "todos" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "todos" (
    "id" bigserial PRIMARY KEY,
    "title" text NOT NULL,
    "description" text NOT NULL,
    "isCompltetd" boolean NOT NULL,
    "userID" bigint NOT NULL
);

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "todos"
    ADD CONSTRAINT "todos_fk_0"
    FOREIGN KEY("userID")
    REFERENCES "serverpod_user_info"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR todoapp
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('todoapp', '20240802164744363', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240802164744363', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth', '20240520102713718', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240520102713718', "timestamp" = now();


COMMIT;
