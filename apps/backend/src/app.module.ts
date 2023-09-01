import { Module } from '@libs/nestjs';
import AppController from './app.controller';

@Module({
  controllers: [AppController],
})
export default class AppModule {}
