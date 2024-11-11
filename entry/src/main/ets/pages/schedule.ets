import { readFile, writeFile } from '../utils/file'
import { course } from '../utils/dataInterface'

let arr: course[];

@Entry
@Component
struct schedule {
  @State day: number = 0;
  @State courses: course[] = [];
  @State str_day: string='日期';

  handleDayChange(day: number) {
    readFile('course').then((courses: course[]) => {
      arr = courses.filter(course => course.day === day)
        .sort((a, b) => a.time - b.time);
      this.courses = arr;  // 更新课程列表
    });
    this.day = day;  // 设置当前星期
  }

  @Builder
  DayMenu(){
    Menu(){
      MenuItem({content:'星期一'})
        .selectIcon(true)
        .onChange((selected: boolean)=>{
          if(selected){
            this.str_day='星期一'
            this.handleDayChange(1);
          }
        })
      MenuItem({content:'星期二'})
        .selectIcon(true)
        .onChange((selected: boolean)=>{
          if(selected){
            this.str_day='星期二'
            this.handleDayChange(2);
          }
        })
      MenuItem({content:'星期三'})
        .selectIcon(true)
        .onChange((selected: boolean)=>{
          if(selected){
            this.str_day='星期三'
            this.handleDayChange(3);
          }
        })
      MenuItem({content:'星期四'})
        .selectIcon(true)
        .onChange((selected: boolean)=>{
          if(selected){
            this.str_day='星期四'
            this.handleDayChange(4);
          }
        })
      MenuItem({content:'星期五'})
        .selectIcon(true)
        .onChange((selected: boolean)=>{
          if(selected){
            this.str_day='星期五'
            this.handleDayChange(5);
          }
        })
      MenuItem({content:'星期六'})
        .selectIcon(true)
        .onChange((selected: boolean)=>{
          if(selected){
            this.str_day='星期六'
            this.handleDayChange(6);
          }
        })
      MenuItem({content:'星期日'})
        .selectIcon(true)
        .onChange((selected: boolean)=>{
          if(selected){
            this.str_day='星期日'
            this.handleDayChange(7);
          }
        })
    }
  }

  build() {
    Column() {
      Row(){
        Text('请选择日期:')
          .fontColor(Color.White)
        Button(this.str_day)
          .backgroundColor('#00BFFF')
          .bindMenu(this.DayMenu())
      }
      .height('8%')
      .backgroundColor('#00BFFF')
      .width('100%')

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
                }
                .margin({left:80})
              }
              .justifyContent(FlexAlign.Center)
              .border({ width: 1 })
              .borderRadius(20)
              .backgroundColor('#4169E1')
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
    .backgroundColor('#E8E8E8')
  }
}
