import { HcSearchBox } from '../commons/components'

@Component
export struct HomePage {
  @StorageProp('topHeight') topHeight: number = 0

  build() {
    Column() {
      Row({ space: 16 }) {
        Image($r('app.media.ic_home_scan'))
          .width(24)
          .aspectRatio(1)
        HcSearchBox({ layoutWeightValue: 1 })
      }
      .width('100%')
      .height(64)
      .padding({ left: 16, right: 16 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.common_gray_bg'))
    .padding({
      top: this.topHeight
    })
  }
}