/**
 * 知识点 window方法setWindowSystemBarProperties 设置主窗口三键导航栏、状态栏的属性
 * 文档：https://developer.huawei.com/consumer/cn/doc/harmonyos-references-V5/js-apis-window-V5#setwindowsystembarproperties9-1
 */
import { window } from '@kit.ArkUI'
import { logger } from './logger'

class StatusBar {
  async setDarkBar() {
    await this.setBar({
      statusBarContentColor: '#000000'
    })
  }

  async setLightBar() {
    await this.setBar({
      statusBarContentColor: '#FFFFFF'
    })
  }

  async setBar(config: window.SystemBarProperties) {
    try {
      const context = AppStorage.get<Context>('context')
      if (context) {
        const win = await window.getLastWindow(context)
        await win.setWindowSystemBarProperties(config)
      }
    } catch (e) {
      logger.error('设置bar失败', JSON.stringify(e))
    }
  }
}

export const statusBar = new StatusBar()