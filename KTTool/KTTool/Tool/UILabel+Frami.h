//
//  UILabel+Frami.h
//  KTTool
//
//  Created by Ki on 2018/2/8.
//  Copyright © 2018年 Ki. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Frami)

//根据宽度求高度  content 计算的内容  width 计算的宽度 font字体大小
- (CGFloat)height_WithText:(NSString *)text Font:(UIFont *)font width:(CGFloat)width;

//根据高度度求宽度  text 计算的内容  Height 计算的高度 font字体大小
- (CGFloat)width_WithText:(NSString *)text Font:(UIFont *)font height:(CGFloat)height;

@end
