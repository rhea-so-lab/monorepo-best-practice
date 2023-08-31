import { bootstrap } from '@libs/nestjs';
import { AppModule } from './app.module';

bootstrap({
  module: AppModule,
  port: 3000,
});
