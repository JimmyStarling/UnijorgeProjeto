BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "__EFMigrationsHistory" (
	"MigrationId"	TEXT NOT NULL,
	"ProductVersion"	TEXT NOT NULL,
	CONSTRAINT "PK___EFMigrationsHistory" PRIMARY KEY("MigrationId")
);
CREATE TABLE IF NOT EXISTS "AspNetRoles" (
	"Id"	TEXT NOT NULL,
	"ConcurrencyStamp"	TEXT,
	"Name"	TEXT,
	"NormalizedName"	TEXT,
	CONSTRAINT "PK_AspNetRoles" PRIMARY KEY("Id")
);
CREATE TABLE IF NOT EXISTS "AspNetUserTokens" (
	"UserId"	TEXT NOT NULL,
	"LoginProvider"	TEXT NOT NULL,
	"Name"	TEXT NOT NULL,
	"Value"	TEXT,
	CONSTRAINT "PK_AspNetUserTokens" PRIMARY KEY("UserId","LoginProvider","Name")
);
CREATE TABLE IF NOT EXISTS "AspNetUsers" (
	"Id"	TEXT NOT NULL,
	"AccessFailedCount"	INTEGER NOT NULL,
	"ConcurrencyStamp"	TEXT,
	"Email"	TEXT,
	"EmailConfirmed"	INTEGER NOT NULL,
	"LockoutEnabled"	INTEGER NOT NULL,
	"LockoutEnd"	TEXT,
	"NormalizedEmail"	TEXT,
	"NormalizedUserName"	TEXT,
	"PasswordHash"	TEXT,
	"PhoneNumber"	TEXT,
	"PhoneNumberConfirmed"	INTEGER NOT NULL,
	"SecurityStamp"	TEXT,
	"TwoFactorEnabled"	INTEGER NOT NULL,
	"UserName"	TEXT,
	CONSTRAINT "PK_AspNetUsers" PRIMARY KEY("Id")
);
CREATE TABLE IF NOT EXISTS "AspNetRoleClaims" (
	"Id"	INTEGER NOT NULL,
	"ClaimType"	TEXT,
	"ClaimValue"	TEXT,
	"RoleId"	TEXT NOT NULL,
	CONSTRAINT "PK_AspNetRoleClaims" PRIMARY KEY("Id" AUTOINCREMENT),
	CONSTRAINT "FK_AspNetRoleClaims_AspNetRoles_RoleId" FOREIGN KEY("RoleId") REFERENCES "AspNetRoles"("Id") ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS "AspNetUserClaims" (
	"Id"	INTEGER NOT NULL,
	"ClaimType"	TEXT,
	"ClaimValue"	TEXT,
	"UserId"	TEXT NOT NULL,
	CONSTRAINT "PK_AspNetUserClaims" PRIMARY KEY("Id" AUTOINCREMENT),
	CONSTRAINT "FK_AspNetUserClaims_AspNetUsers_UserId" FOREIGN KEY("UserId") REFERENCES "AspNetUsers"("Id") ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS "AspNetUserLogins" (
	"LoginProvider"	TEXT NOT NULL,
	"ProviderKey"	TEXT NOT NULL,
	"ProviderDisplayName"	TEXT,
	"UserId"	TEXT NOT NULL,
	CONSTRAINT "PK_AspNetUserLogins" PRIMARY KEY("LoginProvider","ProviderKey"),
	CONSTRAINT "FK_AspNetUserLogins_AspNetUsers_UserId" FOREIGN KEY("UserId") REFERENCES "AspNetUsers"("Id") ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS "AspNetUserRoles" (
	"UserId"	TEXT NOT NULL,
	"RoleId"	TEXT NOT NULL,
	CONSTRAINT "PK_AspNetUserRoles" PRIMARY KEY("UserId","RoleId"),
	CONSTRAINT "FK_AspNetUserRoles_AspNetUsers_UserId" FOREIGN KEY("UserId") REFERENCES "AspNetUsers"("Id") ON DELETE CASCADE,
	CONSTRAINT "FK_AspNetUserRoles_AspNetRoles_RoleId" FOREIGN KEY("RoleId") REFERENCES "AspNetRoles"("Id") ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS "Usuarios" (
	"Id"	TEXT NOT NULL,
	"NomeCompleto"	TEXT NOT NULL,
	"Email"	TEXT NOT NULL,
	"CPF"	TEXT NOT NULL,
	"Telefone"	TEXT NOT NULL,
	"Data"	TEXT NOT NULL,
	"Ativo"	INTEGER NOT NULL,
	CONSTRAINT "PK_Usuarios" PRIMARY KEY("Id")
);
INSERT INTO "__EFMigrationsHistory" ("MigrationId","ProductVersion") VALUES ('00000000000000_CreateIdentitySchema','1.0.2'),
 ('20220727080252_CreateUsuarioTable','6.0.6'),
 ('20220727132220_ModifiedDateTime','6.0.6');
INSERT INTO "AspNetUsers" ("Id","AccessFailedCount","ConcurrencyStamp","Email","EmailConfirmed","LockoutEnabled","LockoutEnd","NormalizedEmail","NormalizedUserName","PasswordHash","PhoneNumber","PhoneNumberConfirmed","SecurityStamp","TwoFactorEnabled","UserName") VALUES ('a75cf781-aaca-4b4b-96f9-6f7995bbbaf3',0,'82e836f2-0006-42eb-8ab7-bc78a5486fc8','jimmy_starling@hotmail.com',1,1,NULL,'JIMMY_STARLING@HOTMAIL.COM','JIMMY_STARLING@HOTMAIL.COM','AQAAAAEAACcQAAAAEDukQKvWZlEb/V1HjX+JHlf3mTO7xsMohTsq/u8SD8GuFacmTMSGIfKpg0oAeVuldQ==',NULL,0,'DTUVDDJ3MSUQNAZOQIIWCROP4ZLGPHKW',0,'jimmy_starling@hotmail.com');
CREATE INDEX IF NOT EXISTS "RoleNameIndex" ON "AspNetRoles" (
	"NormalizedName"
);
CREATE INDEX IF NOT EXISTS "IX_AspNetRoleClaims_RoleId" ON "AspNetRoleClaims" (
	"RoleId"
);
CREATE INDEX IF NOT EXISTS "IX_AspNetUserClaims_UserId" ON "AspNetUserClaims" (
	"UserId"
);
CREATE INDEX IF NOT EXISTS "IX_AspNetUserLogins_UserId" ON "AspNetUserLogins" (
	"UserId"
);
CREATE INDEX IF NOT EXISTS "IX_AspNetUserRoles_RoleId" ON "AspNetUserRoles" (
	"RoleId"
);
CREATE INDEX IF NOT EXISTS "IX_AspNetUserRoles_UserId" ON "AspNetUserRoles" (
	"UserId"
);
CREATE INDEX IF NOT EXISTS "EmailIndex" ON "AspNetUsers" (
	"NormalizedEmail"
);
CREATE UNIQUE INDEX IF NOT EXISTS "UserNameIndex" ON "AspNetUsers" (
	"NormalizedUserName"
);
COMMIT;
