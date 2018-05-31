//
//  UIColor+HexString.h
//  KTTool
//
//  Created by Ki on 2018/2/8.
//  Copyright © 2018年 Ki. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (HexString)

// 颜色转换：iOS中（以#开头）十六进制的颜色转换为UIColor(RGB)
+ (UIColor *)colorWithHexString:(NSString *)color;

@end
