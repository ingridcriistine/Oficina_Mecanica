/*
  Warnings:

  - You are about to drop the `user` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
DROP TABLE `user`;

-- CreateTable
CREATE TABLE `Cliente` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `email` VARCHAR(191) NOT NULL,
    `telefone` VARCHAR(191) NOT NULL,
    `endereço` VARCHAR(191) NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    UNIQUE INDEX `Cliente_email_key`(`email`),
    UNIQUE INDEX `Cliente_telefone_key`(`telefone`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Veiculo` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `marca` VARCHAR(191) NOT NULL,
    `modelo` VARCHAR(191) NOT NULL,
    `ano` INTEGER NOT NULL,
    `placa` VARCHAR(191) NOT NULL,
    `clienteId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Servico` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `descricao` VARCHAR(191) NOT NULL,
    `preco` DOUBLE NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `ItemServico` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `quantidade` INTEGER NOT NULL,
    `precoTotal` DOUBLE NOT NULL,
    `servicoId` INTEGER NOT NULL,
    `ordemId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `OrdemServico` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `dataEntrada` DATETIME(3) NOT NULL,
    `dataConclusao` DATETIME(3) NOT NULL,
    `status` VARCHAR(191) NOT NULL,
    `Observacoes` VARCHAR(191) NOT NULL,
    `clienteId` INTEGER NOT NULL,
    `veiculoId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Veiculo` ADD CONSTRAINT `Veiculo_clienteId_fkey` FOREIGN KEY (`clienteId`) REFERENCES `Cliente`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ItemServico` ADD CONSTRAINT `ItemServico_servicoId_fkey` FOREIGN KEY (`servicoId`) REFERENCES `Servico`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ItemServico` ADD CONSTRAINT `ItemServico_ordemId_fkey` FOREIGN KEY (`ordemId`) REFERENCES `OrdemServico`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `OrdemServico` ADD CONSTRAINT `OrdemServico_clienteId_fkey` FOREIGN KEY (`clienteId`) REFERENCES `Cliente`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `OrdemServico` ADD CONSTRAINT `OrdemServico_veiculoId_fkey` FOREIGN KEY (`veiculoId`) REFERENCES `Veiculo`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
