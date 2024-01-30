-- CreateTable
CREATE TABLE `Receipt` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `rentalId` INTEGER NOT NULL,
    `receiptNumber` VARCHAR(191) NOT NULL,
    `fieldId` INTEGER NOT NULL,
    `issueDate` DATETIME(3) NOT NULL,
    `customerName` VARCHAR(191) NOT NULL,
    `amount` DOUBLE NOT NULL,

    UNIQUE INDEX `Receipt_receiptNumber_key`(`receiptNumber`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Receipt` ADD CONSTRAINT `Receipt_rentalId_fkey` FOREIGN KEY (`rentalId`) REFERENCES `Rental`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Receipt` ADD CONSTRAINT `Receipt_fieldId_fkey` FOREIGN KEY (`fieldId`) REFERENCES `FootballField`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
