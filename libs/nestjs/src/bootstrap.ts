import { INestApplication } from '@nestjs/common';
import { NestFactory } from '@nestjs/core';

export async function bootstrap(input: { module: any; port: number }): Promise<INestApplication> {
  const { module, port } = input;
  const app: INestApplication = await NestFactory.create(module);
  await app.listen(port);
  return app;
}
