@Entry
@Component
struct Index {
  // 从Appstore context中获取值
  @StorageProp('topHeight') topHeight: number = 0
  @StorageProp('bottomHeight') bottomHeight: number = 0

  build() {
    Column() {
      Text('top')
      Blank()
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