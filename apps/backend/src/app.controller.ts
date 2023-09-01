import { Controller, Get } from '@libs/nestjs';

@Controller()
export default class AppController {
  @Get('/health')
  healthCheck() {
    return {
      status: 'ok',
    };
  }
}
