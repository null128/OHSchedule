import { router } from '@kit.ArkUI';

@Entry
@Component
struct Index {
  build() {
    Column(){
      Text('Welcome to use OHSchedule!')
        .fontSize(24)
        .fontWeight(FontWeight.Bolder)
        .width('95%')
        .margin({top:'10%',bottom:'20%'})
        .align(Alignment.Center)
      Image('images/logo.jpg')
        .width('50%')
        .margin({bottom:'20%'})
      Button('查看课表',{type:ButtonType.Normal})
        .onClick(()=>{
          router.pushUrl({url: 'pages/schedule'})
        })
        .borderRadius(15)
        .width('60%')
        .fontSize(25)
        .margin({top:'15%'})
      Button('增加课程',{type:ButtonType.Normal})
        .onClick(()=>{
          router.pushUrl({url: 'pages/add_course'})
        })
        .borderRadius(15)
        .width('60%')
        .fontSize(25)
        .margin({top:'10%'})
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#E8E8E8')
  }
}