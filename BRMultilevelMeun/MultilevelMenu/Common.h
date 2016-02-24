//
//  Common.h
//  qzc
//
//  Created by jxm apple on 16/2/16.
//  Copyright © 2016年 xinggenji. All rights reserved.
//

#import "UIColor+Hex.h"

#ifndef Common_h
#define Common_h

#endif /* Common_h */

// RGB颜色设定
#define RGB(r, g, b) [UIColor colorWithRed:(r) / 255.0f green:(g) / 255.0f blue:(b) / 255.0f alpha:1]
#define RGBA(r, g, b, a) [UIColor colorWithRed:r / 255.0f green:g / 255.0f blue:b / 255.0f alpha:a]

//常用颜色
#define ColorWithHexString(colorString) [UIColor colorWithHexString:(colorString)] //颜色进制转换
#define ColorAlphaWithHexString(colorString, a) [UIColor colorWithHexString: (colorString) alpha:a]


//1.全局用色
#define AppMainStyleColor ColorWithHexString(@"#10aeff") //主色 系统主题色 蓝色
#define SubColorR ColorWithHexString(@"#d9534f") //辅助色 暗红
#define SubColorY ColorWithHexString(@"#ffbe00") //辅助色 橘黄

//2.背景用色
#define BGCPage ColorWithHexString(@"#f9f9f9") //大部分背景用色，聊天、更多选项用色
#define TableColor ColorAlphaWithHexString(@"#fafafa",0.95) //Table栏用色(95%的透明度)，输入框的框背景用色(聊天输入，搜索输入框)

//3.边框用色
#define BorDerColor ColorWithHexString(@"#ddd") //大部分边框用色
#define SetBorDerColor ColorWithHexString(@"#eee") //具体请见个人中心(我、设置)

//4.文字用色
#define AppMainFontColor ColorWithHexString(@"#bbb")
#define TableFontColor ColorWithHexString(@"#fff") //仅Table用 白色
#define PromptFontColor ColorWithHexString(@"#999") //提示性文字(例：输入框提示文字)，内容文字
#define TitleAndTextColor ColorWithHexString(@"#333") //标题、正文
#define ImportantRemindersColor ColorWithHexString(@"#d9534f") //重要提醒


//TODO 下面的颜色还未修改
#define AppNavBGColor RGB(15,15,15) //系统导航黑色背景
#define AppNavTextColor [UIColor whiteColor] //系统导航白色文字颜色

#define AppVCBGColor RGB(240, 240, 240) //UIViewController 的背景颜色 灰色

//屏膜宽高
#define IPHONE_WIDTH ([UIScreen mainScreen].applicationFrame.size.width)
#define IPHONE_HEIGHT ([UIScreen mainScreen].applicationFrame.size.height)

