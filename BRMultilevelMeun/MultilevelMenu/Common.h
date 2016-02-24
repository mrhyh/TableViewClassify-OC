//
//  Common.h
//  qzc
//
//  Created by jxm apple on 16/2/16.
//  Copyright © 2016年 xinggenji. All rights reserved.
//

#ifndef Common_h
#define Common_h

#endif /* Common_h */

// RGB颜色设定
#define RGB(r, g, b) [UIColor colorWithRed:(r) / 255.0f green:(g) / 255.0f blue:(b) / 255.0f alpha:1]
#define RGBA(r, g, b, a) [UIColor colorWithRed:r / 255.0f green:g / 255.0f blue:b / 255.0f alpha:a]

//常用颜色
#define BGCPage RGB(246, 247, 249) //页面背景色

#define AppNavBGColor RGB(15,15,15) //系统导航黑色背景
#define AppNavTextColor [UIColor whiteColor] //系统导航白色文字颜色
#define AppMainStyleColor RGB(35, 176, 252) //系统主题色 蓝色
#define AppVCBGColor RGB(240, 240, 240) //UIViewController 的背景颜色 灰色

//屏膜宽高
#define IPHONE_WIDTH ([UIScreen mainScreen].applicationFrame.size.width)
#define IPHONE_HEIGHT ([UIScreen mainScreen].applicationFrame.size.height)