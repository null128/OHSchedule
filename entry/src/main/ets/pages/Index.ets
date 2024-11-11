import { router } from '@kit.ArkUI';
import { createFile } from '../utils/file'

@Entry
@Component
struct Index {
  build() {
    Column(){
      Text('Welcome to use OHSchedule!')
        .fontSize(24)
        .fontWeight(FontWeight.Bolder)
        .width('95%')
        .margin({top:'15%',bottom:'20%'})
        .align(Alignment.Center)
      Image('images/logo.jpg')
        .width('45%')
        .margin({bottom:'20%'})
      // Text('每天进步一点点，你的人生大不同！')
      //   .width(350)
      //   .textAlign(TextAlign.Start)
      //   .fontSize(20)
      //   .fontWeight(FontWeight.Medium)
      // Text('——李因斯雷')
      //   .width(350)
      //   .textAlign(TextAlign.End)
      //   .fontSize(20)
      //   .fontWeight(FontWeight.Medium)
      //   .margin({bottom:180})
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
    //.backgroundImage('images/background.jpg')
    //.backgroundImageSize(ImageSize.FILL)
  }
}