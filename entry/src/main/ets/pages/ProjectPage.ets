@Component
export struct ProjectPage {
  @State message: string = 'Hello World';

  build() {
    Column() {
      Text("ProjectPage")
    }
    .width('100%')
    .height('100%')
  }
}