import { statusBar } from '../commons/utils'

@Entry
@Component
struct Index {
  // 从Appstore context中获取值
  @StorageProp('topHeight') topHeight: number = 0
  @StorageProp('bottomHeight') bottomHeight: number = 0

  build() {
    Column() {
      Text('top')
      Row() {
        Button('Light').onClick(() => {
          statusBar.setLightBar()
        })
        Button('Dark').onClick(() => {
          statusBar.setDarkBar()
        })
      }

      Text('bottom')
    }
    .width('100%')
    .height('100%')
    .backgroundColor('red')
    .padding({
      top: this.topHeight,
      bottom: this.bottomHeight
    })
  }
}