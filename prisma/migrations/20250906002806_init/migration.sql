/*
  Warnings:

  - You are about to drop the `Consumption` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Member` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Owner` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Park` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Pass` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Product` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Store` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `StorePark` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "public"."Consumption" DROP CONSTRAINT "Consumption_memberId_fkey";

-- DropForeignKey
ALTER TABLE "public"."Consumption" DROP CONSTRAINT "Consumption_passId_fkey";

-- DropForeignKey
ALTER TABLE "public"."Member" DROP CONSTRAINT "Member_passId_fkey";

-- DropForeignKey
ALTER TABLE "public"."Pass" DROP CONSTRAINT "Pass_parkId_fkey";

-- DropForeignKey
ALTER TABLE "public"."Product" DROP CONSTRAINT "Product_storeId_fkey";

-- DropForeignKey
ALTER TABLE "public"."Store" DROP CONSTRAINT "Store_ownerId_fkey";

-- DropForeignKey
ALTER TABLE "public"."StorePark" DROP CONSTRAINT "StorePark_parkId_fkey";

-- DropForeignKey
ALTER TABLE "public"."StorePark" DROP CONSTRAINT "StorePark_storeId_fkey";

-- DropTable
DROP TABLE "public"."Consumption";

-- DropTable
DROP TABLE "public"."Member";

-- DropTable
DROP TABLE "public"."Owner";

-- DropTable
DROP TABLE "public"."Park";

-- DropTable
DROP TABLE "public"."Pass";

-- DropTable
DROP TABLE "public"."Product";

-- DropTable
DROP TABLE "public"."Store";

-- DropTable
DROP TABLE "public"."StorePark";

-- CreateTable
CREATE TABLE "public"."parks" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "location" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "parks_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."passes" (
    "id" TEXT NOT NULL,
    "type" "public"."PassType" NOT NULL,
    "qrCode" TEXT NOT NULL,
    "credits" INTEGER NOT NULL,
    "parkId" TEXT NOT NULL,
    "validDate" TIMESTAMP(3) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "passes_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."members" (
    "id" TEXT NOT NULL,
    "firstName" TEXT NOT NULL,
    "lastName" TEXT NOT NULL,
    "birthDate" TIMESTAMP(3) NOT NULL,
    "nationality" TEXT NOT NULL,
    "personType" "public"."PersonType" NOT NULL,
    "passId" TEXT NOT NULL,

    CONSTRAINT "members_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."consumptions" (
    "id" TEXT NOT NULL,
    "passId" TEXT NOT NULL,
    "memberId" TEXT,
    "location" TEXT NOT NULL,
    "item" TEXT NOT NULL,
    "amount" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "consumptions_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."owners" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "phone" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "owners_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."stores" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "location" TEXT,
    "ownerId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "stores_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."products" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "credits" INTEGER NOT NULL,
    "stock" INTEGER NOT NULL,
    "category" TEXT,
    "storeId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "products_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."store_parks" (
    "id" TEXT NOT NULL,
    "storeId" TEXT NOT NULL,
    "parkId" TEXT NOT NULL,

    CONSTRAINT "store_parks_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "passes_qrCode_key" ON "public"."passes"("qrCode");

-- CreateIndex
CREATE UNIQUE INDEX "owners_email_key" ON "public"."owners"("email");

-- AddForeignKey
ALTER TABLE "public"."passes" ADD CONSTRAINT "passes_parkId_fkey" FOREIGN KEY ("parkId") REFERENCES "public"."parks"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."members" ADD CONSTRAINT "members_passId_fkey" FOREIGN KEY ("passId") REFERENCES "public"."passes"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."consumptions" ADD CONSTRAINT "consumptions_passId_fkey" FOREIGN KEY ("passId") REFERENCES "public"."passes"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."consumptions" ADD CONSTRAINT "consumptions_memberId_fkey" FOREIGN KEY ("memberId") REFERENCES "public"."members"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."stores" ADD CONSTRAINT "stores_ownerId_fkey" FOREIGN KEY ("ownerId") REFERENCES "public"."owners"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."products" ADD CONSTRAINT "products_storeId_fkey" FOREIGN KEY ("storeId") REFERENCES "public"."stores"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."store_parks" ADD CONSTRAINT "store_parks_storeId_fkey" FOREIGN KEY ("storeId") REFERENCES "public"."stores"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."store_parks" ADD CONSTRAINT "store_parks_parkId_fkey" FOREIGN KEY ("parkId") REFERENCES "public"."parks"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
