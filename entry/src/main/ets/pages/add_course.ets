//增加课程页面
import { appendFile } from '../utils/file'
import { course } from '../utils/dataInterface'
import { router } from '@kit.ArkUI';


let name: string | undefined;
let place: string | undefined;
let day: number;
let time: number;

@Entry
@Component

struct add_course{
  @State str_day: string='日期';
  @State str_time: string='时间';

  @Builder
  DayMenu(){
    Menu(){
      MenuItem({content:'星期一'})
        .selectIcon(true)
        .onChange((selected: boolean)=>{
          if(selected){
            this.str_day='星期一'
            day=1;
          }
        })
      MenuItem({content:'星期二'})
        .selectIcon(true)
        .onChange((selected: boolean)=>{
          if(selected){
            this.str_day='星期二'
            day=2;
          }
        })
      MenuItem({content:'星期三'})
        .selectIcon(true)
        .onChange((selected: boolean)=>{
          if(selected){
            this.str_day='星期三'
            day=3;
          }
        })
      MenuItem({content:'星期四'})
        .selectIcon(true)
        .onChange((selected: boolean)=>{
          if(selected){
            this.str_day='星期四'
            day=4;
          }
        })
      MenuItem({content:'星期五'})
        .selectIcon(true)
        .onChange((selected: boolean)=>{
          if(selected){
            this.str_day='星期五'
            day=5;
          }
        })
      MenuItem({content:'星期六'})
        .selectIcon(true)
        .onChange((selected: boolean)=>{
          if(selected){
            this.str_day='星期六'
            day=6;
          }
        })
      MenuItem({content:'星期日'})
        .selectIcon(true)
        .onChange((selected: boolean)=>{
          if(selected){
            this.str_day='星期日'
            day=7;
          }
        })
    }
  }

  @Builder
  TimeMenu(){
    Menu(){
      MenuItem({content:'一二节'})
        .selectIcon(true)
        .onChange((selected: boolean)=>{
          if(selected){
            this.str_time='一二节'
            time=1;
          }
        })
      MenuItem({content:'三四节'})
        .selectIcon(true)
        .onChange((selected: boolean)=>{
          if(selected){
            this.str_time='三四节'
            time=2;
          }
        })
      MenuItem({content:'五六节'})
        .selectIcon(true)
        .onChange((selected: boolean)=>{
          if(selected){
            this.str_time='五六节'
            time=3;
          }
        })
      MenuItem({content:'七八节'})
        .selectIcon(true)
        .onChange((selected: boolean)=>{
          if(selected){
            this.str_time='七八节'
            time=4;
          }
        })
      MenuItem({content:'九十节'})
        .selectIcon(true)
        .onChange((selected: boolean)=>{
          if(selected){
            this.str_time='九十节'
            time=5;
          }
        })
    }
  }

  build(){
    Column(){
      TextInput({ placeholder: '请输入课程名称' })
        .margin({top:30})
        .onChange((value:string)=>{
          name=value;
        })
      TextInput({ placeholder: '请输入上课地点' })
        .margin({top:30})
        .onChange((value:string)=>{
          place=value;
        })
      Row(){
        Text('请选择课程时间')
          .fontColor('#666666')
        Button(this.str_day)
          .margin({right:24})
          .fontColor('#666666')
          .backgroundColor('#E0E0E0')
          .bindMenu(this.DayMenu())
        Button(this.str_time)
          .fontColor('#666666')
          .backgroundColor('#E0E0E0')
          .bindMenu(this.TimeMenu())
      }
        .border({width:1})
        .borderRadius(10)
        .borderColor('#E8E8E8')
        .backgroundColor('#E0E0E0')
        .margin({top:30,bottom:10})
        .width('96%')

      Button('确认新增')
        .onClick(()=>{
          let new_course: course= {
            name: name,
            place: place,
            day: day,
            time: time
          }
          if (new_course.name===undefined)
            console.log('课程名称为空')
          else{
            if (new_course.place===undefined)
              console.log('上课地点为空')
            else{
              if (new_course.day==0||new_course.time==0)
                console.log('请选择课程时间')
              else{
                // console.log('name:',new_course.name)
                // console.log('place:',new_course.place)
                // console.log('day',new_course.day)
                // console.log('time',new_course.time)
                //appendFile('course',new_course)
                /*let arr: course[]=[];
                arr.push(new_course)*/
                /*for(let item of arr){
                  console.log('name:',item.name)
                  console.log('place:',item.place)
                  console.log('day',item.day)
                  console.log('time',item.time)
                }*/
                /*writeFile('course',arr).then((res: string)=>{
                  console.info(res)
                })
                  .catch((res: string)=>{
                    console.info(res)
                  })*/
                appendFile('course',new_course)
                router.replaceUrl({url: 'pages/Index'})
              }
            }
          }
        })
        .margin({top:20})
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#E8E8E8')
    //.backgroundImage('images/background.jpg')
    //.backgroundImageSize(ImageSize.FILL)
  }
}