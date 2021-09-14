import { TransactionType } from '../entities/transaction.entity';

export class CreateTransactionDto {
  id: string;

  type: TransactionType;

  amount: number;
}
