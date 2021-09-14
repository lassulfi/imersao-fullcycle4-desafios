import { Module } from '@nestjs/common';
import { ConfigModule } from '@nestjs/config';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { TransactionsModule } from './transactions/transactions.module';
import { SequelizeModule } from '@nestjs/sequelize';
import { Transaction } from './transactions/entities/transaction.entity';

@Module({
  imports: [
    ConfigModule.forRoot(),
    SequelizeModule.forRoot({
      dialect: process.env.DB_DIALECT_TEST as any,
      storage: `./${process.env.DB_STORAGE_TEST}`,
      database: process.env.DB_NAME_TEST,
      models: [Transaction],
      autoLoadModels: true,
      synchronize: true,
      sync: {
        alter: true,
        // force: true,
      },
    }),
    TransactionsModule,
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
