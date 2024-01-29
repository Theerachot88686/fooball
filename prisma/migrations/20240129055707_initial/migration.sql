/*
  Warnings:

  - You are about to drop the `brand` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `cart` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `cart_product` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `category` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `favorite` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `favorite_product` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `order` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `order_product` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `product` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `product_img` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `product_promotion` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `promotion` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `search` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `shipping_address` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `status` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `user` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `user_search` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE `cart` DROP FOREIGN KEY `Cart_user_id_fkey`;

-- DropForeignKey
ALTER TABLE `cart_product` DROP FOREIGN KEY `Cart_product_cart_id_fkey`;

-- DropForeignKey
ALTER TABLE `cart_product` DROP FOREIGN KEY `Cart_product_product_id_fkey`;

-- DropForeignKey
ALTER TABLE `favorite` DROP FOREIGN KEY `Favorite_user_id_fkey`;

-- DropForeignKey
ALTER TABLE `favorite_product` DROP FOREIGN KEY `Favorite_Product_favorite_id_fkey`;

-- DropForeignKey
ALTER TABLE `favorite_product` DROP FOREIGN KEY `Favorite_Product_product_id_fkey`;

-- DropForeignKey
ALTER TABLE `order` DROP FOREIGN KEY `Order_user_id_fkey`;

-- DropForeignKey
ALTER TABLE `order_product` DROP FOREIGN KEY `Order_product_orderId_fkey`;

-- DropForeignKey
ALTER TABLE `order_product` DROP FOREIGN KEY `Order_product_product_id_fkey`;

-- DropForeignKey
ALTER TABLE `product` DROP FOREIGN KEY `Product_brand_id_fkey`;

-- DropForeignKey
ALTER TABLE `product` DROP FOREIGN KEY `Product_categoryId_fkey`;

-- DropForeignKey
ALTER TABLE `product` DROP FOREIGN KEY `Product_user_id_fkey`;

-- DropForeignKey
ALTER TABLE `product_img` DROP FOREIGN KEY `Product_Img_product_id_fkey`;

-- DropForeignKey
ALTER TABLE `product_promotion` DROP FOREIGN KEY `Product_Promotion_product_id_fkey`;

-- DropForeignKey
ALTER TABLE `product_promotion` DROP FOREIGN KEY `Product_Promotion_promotion_id_fkey`;

-- DropForeignKey
ALTER TABLE `shipping_address` DROP FOREIGN KEY `Shipping_Address_user_id_fkey`;

-- DropForeignKey
ALTER TABLE `status` DROP FOREIGN KEY `Status_order_id_fkey`;

-- DropForeignKey
ALTER TABLE `user_search` DROP FOREIGN KEY `User_Search_search_id_fkey`;

-- DropForeignKey
ALTER TABLE `user_search` DROP FOREIGN KEY `User_Search_user_id_fkey`;

-- DropTable
DROP TABLE `brand`;

-- DropTable
DROP TABLE `cart`;

-- DropTable
DROP TABLE `cart_product`;

-- DropTable
DROP TABLE `category`;

-- DropTable
DROP TABLE `favorite`;

-- DropTable
DROP TABLE `favorite_product`;

-- DropTable
DROP TABLE `order`;

-- DropTable
DROP TABLE `order_product`;

-- DropTable
DROP TABLE `product`;

-- DropTable
DROP TABLE `product_img`;

-- DropTable
DROP TABLE `product_promotion`;

-- DropTable
DROP TABLE `promotion`;

-- DropTable
DROP TABLE `search`;

-- DropTable
DROP TABLE `shipping_address`;

-- DropTable
DROP TABLE `status`;

-- DropTable
DROP TABLE `user`;

-- DropTable
DROP TABLE `user_search`;

-- CreateTable
CREATE TABLE `Customer` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `email` VARCHAR(191) NOT NULL,
    `phone` VARCHAR(191) NULL,

    UNIQUE INDEX `Customer_email_key`(`email`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `FootballField` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `fieldName` VARCHAR(191) NOT NULL,
    `address` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Rental` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `customerId` INTEGER NOT NULL,
    `fieldId` INTEGER NOT NULL,
    `rentalDateTime` DATETIME(3) NOT NULL,
    `duration` INTEGER NOT NULL,
    `totalPrice` DOUBLE NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Rental` ADD CONSTRAINT `Rental_customerId_fkey` FOREIGN KEY (`customerId`) REFERENCES `Customer`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Rental` ADD CONSTRAINT `Rental_fieldId_fkey` FOREIGN KEY (`fieldId`) REFERENCES `FootballField`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
