import { window } from '@kit.ArkUI'
import { logger } from './logger'

class FullScreen {
  /**
   * 开启沉浸式
   */
  async enable() {
    try {
      const context = AppStorage.get<Context>('context')
      if (context) {
        const win = await window.getLastWindow(context) // 获取当前窗口对象
        await win.setWindowLayoutFullScreen(true)
        // AvoidAreaType 窗口内容需要规避区域的类型枚举。
        // TYPE_SYSTEM 	表示系统默认区域。一般包括状态栏、导航栏，各设备系统定义可能不同。
        const topArea = win.getWindowAvoidArea(window.AvoidAreaType.TYPE_SYSTEM) // 获取
        AppStorage.setOrCreate('topHeight', px2vp(topArea.topRect.height))
        // 导航条区域
        const bottomArea = win.getWindowAvoidArea(window.AvoidAreaType.TYPE_NAVIGATION_INDICATOR)
        AppStorage.setOrCreate('bottomHeight', px2vp(bottomArea.bottomRect.height))
      }
    } catch (e) {
      logger.error('开启沉浸式失败', JSON.stringify(e))
    }
  }

  /**
   * 关闭沉浸式
   */
  async disabled() {
    try {
      const context = AppStorage.get<Context>('context')
      if (context) {
        const win = await window.getLastWindow(context)
        await win.setWindowLayoutFullScreen(false)
        AppStorage.setOrCreate('topHeight', 0)
        AppStorage.setOrCreate('bottomHeight', 0)
      }
    } catch (e) {
      logger.error('关闭沉浸式失败', JSON.stringify(e))
    }
  }
}

export const fullScreen = new FullScreen()