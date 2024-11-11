import { readFile, writeFile } from '../utils/file'
import { course } from '../utils/dataInterface'

let arr: course[];

@Entry
@Component
struct schedule {
  @State day: number = 0;
  @State courses: course[] = [];

  @Builder
  DayMenu(){
    Menu(){
      MenuItem({content:'星期一'})
        .selectIcon(true)
        .onChange((selected: boolean)=>{
          if(selected){
            this.day=1;
          }
        })
      MenuItem({content:'星期二'})
        .selectIcon(true)
        .onChange((selected: boolean)=>{
          if(selected){
            this.day=2;
          }
        })
      MenuItem({content:'星期三'})
        .selectIcon(true)
        .onChange((selected: boolean)=>{
          if(selected){
            this.day=3;
          }
        })
      MenuItem({content:'星期四'})
        .selectIcon(true)
        .onChange((selected: boolean)=>{
          if(selected){
            this.day=4;
          }
        })
      MenuItem({content:'星期五'})
        .selectIcon(true)
        .onChange((selected: boolean)=>{
          if(selected){
            this.day=5;
          }
        })
      MenuItem({content:'星期六'})
        .selectIcon(true)
        .onChange((selected: boolean)=>{
          if(selected){
            this.day=6;
          }
        })
      MenuItem({content:'星期日'})
        .selectIcon(true)
        .onChange((selected: boolean)=>{
          if(selected){
            this.day=7;
          }
        })
    }
  }

  // 处理星期选择的公共函数
  handleDayChange(day: number) {
    readFile('course').then((courses: course[]) => {
      arr = courses.filter(course => course.day === day)
        .sort((a, b) => a.time - b.time);
      this.courses = arr;  // 更新课程列表
    });
    this.day = day;  // 设置当前星期
  }

  build() {
    Column() {
      Row(){
        Text('请选择日期:')
          .margin({ top: 20 })
          .fontColor(Color.White)
      }
      .backgroundColor('#00BFFF')
      .width('100%')
      /*Column(){
        Text('请选择日期:')
          .margin({ top: 20 })
          .fontColor(Color.White)
        // 星期选择
        Row() {
          this.renderDayRadio('day1', '星期一', 1);
          this.renderDayRadio('day2', '星期二', 2);
          this.renderDayRadio('day3', '星期三', 3);
          this.renderDayRadio('day4', '星期四', 4);
          this.renderDayRadio('day5', '星期五', 5);
          this.renderDayRadio('day6', '星期六', 6);
          this.renderDayRadio('day7', '星期日', 7);
        }
        .margin({ top: 20 })
        .backgroundColor('#CFCFCF')
        .width('100%')
      }
        .backgroundColor('#00BFFF')
        .width('100%')*/

      // 使用框架的 ForEach 组件来循环渲染课程
      List(){
        if(this.courses.length!=0){
          ForEach(this.courses,(item:course)=>{
            ListItem(){
              Row(){
                Column(){
                  Text(`课程名称: ${item.name}`)
                    .fontSize(20)
                    .textAlign(TextAlign.Center)
                    .fontColor(Color.White)
                    .margin({ top: 10 });
                  if (item.time===1) {
                    Text(`时间: 一二节`)
                      .fontSize(16)
                      .textAlign(TextAlign.Center)
                      .fontColor(Color.White)
                      .margin({ top: 10 });
                  }
                  else if (item.time===2) {
                    Text(`时间: 三四节`)
                      .fontSize(16)
                      .textAlign(TextAlign.Center)
                      .fontColor(Color.White)
                      .margin({ top: 10 });
                  }
                  else if (item.time===3) {
                    Text(`时间: 五六节`)
                      .fontSize(16)
                      .textAlign(TextAlign.Center)
                      .fontColor(Color.White)
                      .margin({ top: 10 });
                  }
                  else if (item.time===4) {
                    Text(`时间: 七八节`)
                      .fontSize(16)
                      .textAlign(TextAlign.Center)
                      .fontColor(Color.White)
                      .margin({ top: 10 });
                  }
                  else if (item.time===5) {
                    Text(`时间: 九十节`)
                      .fontSize(16)
                      .textAlign(TextAlign.Center)
                      .fontColor(Color.White)
                      .margin({ top: 10 });
                  }
                  Text(`上课地点: ${item.place}`)
                    .fontSize(18)
                    .textAlign(TextAlign.Center)
                    .fontColor(Color.White)
                    .margin({ top: 10,bottom: 10 });
                }
                Column(){
                  Button(){
                    Text() {
                      SymbolSpan($r('sys.symbol.ohos_trash'))
                        .fontWeight(FontWeight.Normal)
                        .fontSize(32)
                        .fontWeight(FontWeight.Normal)
                        .fontColor([Color.White])
                    }
                  }
                    .backgroundColor('#4169E1')
                    .onClick(()=>{
                      readFile('course').then((res: course[])=>{
                        res=res.filter(course=>!(course.day === item.day
                          && course.time === item.time
                          && course.name === item.name))
                        writeFile('course',res);
                      })
                    })
                  /*Button('删除课程')
                    .onClick(()=>{
                      readFile('course').then((res: course[])=>{
                        res=res.filter(course=>!(course.day === item.day
                          && course.time === item.time
                          && course.name === item.name))
                        writeFile('course',res);
                      })
                    })
                    .fontColor(Color.Black)
                    .fontWeight(FontWeight.Normal)
                    .backgroundColor('#ADD8E6')//#87CEFA*/
                }
                .margin({left:80})
              }
              .justifyContent(FlexAlign.Center)
              .border({ width: 1 })
              .borderRadius(20)
              .backgroundColor('#4169E1')//#FFC1C1
              .width('90%')
            }
            .margin({top:20})
          })
        }
      }
      .alignListItem(ListItemAlign.Center)
    }
    .width('100%')
    .height('100%')
    //.backgroundImage('images/background.jpg')
    //.backgroundImageSize(ImageSize.FILL);
    .backgroundColor('#E8E8E8')
  }
}
