//
//  UIColor+Hex.h
//  qzc
//
//  Created by jxm apple on 16/2/23.
//  Copyright © 2016年 xinggenji. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Hex)

+ (UIColor*)colorWithHexString:(NSString*)color;

//从十六进制字符串获取颜色，
//color:支持@“#123456”、 @“0X123456”、 @“123456”三种格式
+ (UIColor*)colorWithHexString:(NSString*)color alpha:(CGFloat)alpha;

@end
