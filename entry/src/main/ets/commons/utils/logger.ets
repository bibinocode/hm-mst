import hilog from '@ohos.hilog';

/**
 * 基于hilog封装日志库
 */
const DOMAIN = 0xFF09 // 用于指定输出日志所对应的业务领域
const PREFIX = 'PASS_INTERVIEW_LOGGER' // 日志前缀
const FORMAT = '%{public}s, %{public}s' // 自定义格式化

class Logger {
  debug(...args: string[]) {
    hilog.debug(DOMAIN, PREFIX, FORMAT, args)
  }

  info(...args: string[]) {
    hilog.info(DOMAIN, PREFIX, FORMAT, args)
  }

  warn(...args: string[]) {
    hilog.warn(DOMAIN, PREFIX, FORMAT, args)
  }

  error(...args: string[]) {
    hilog.error(DOMAIN, PREFIX, FORMAT, args)
  }

  fatal(...args: string[]) {
    hilog.fatal(DOMAIN, PREFIX, FORMAT, args)
  }

  isLoggable(level: hilog.LogLevel) {
    hilog.isLoggable(DOMAIN, PREFIX, level)
  }
}

export const logger = new Logger()

