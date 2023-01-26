import { InjectQueue } from '@nestjs/bull';
import { Inject, Injectable } from '@nestjs/common';
import { Queue } from 'bull';
import { TRANSCODE_QUEUE } from './constants';

@Injectable()
export class AppService {
  constructor(@InjectQueue(TRANSCODE_QUEUE) private readonly transcodeQueue: Queue) {}
  getHello(): string {
    return 'Hello World!';
  }
  async transcode() {
    await this.transcodeQueue.add({
      file: 'file.mp3',
    });
  }
}
