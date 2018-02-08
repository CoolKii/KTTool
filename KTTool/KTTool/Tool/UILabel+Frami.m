//
//  UILabel+Frami.m
//  KTTool
//
//  Created by Ki on 2018/2/8.
//  Copyright © 2018年 Ki. All rights reserved.
//

#import "UILabel+Frami.h"

@implementation UILabel (Frami)
//根据宽度求高度  content 计算的内容  width 计算的宽度 font字体大小
- (CGFloat)height_WithText:(NSString *)text Font:(UIFont *)font width:(CGFloat)width{
    //UIFont * font = [UIFont fontWithName:@"PingFangSC-Light" size:14];
    CGRect rect = [text boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil];
    
    return rect.size.height;
}
//根据高度度求宽度  text 计算的内容  Height 计算的高度 font字体大小
- (CGFloat)width_WithText:(NSString *)text Font:(UIFont *)font height:(CGFloat)height{
    //UIFont * font = [UIFont fontWithName:@"PingFangSC-Light" size:14];
    CGRect rect = [text boundingRectWithSize:CGSizeMake(MAXFLOAT, height) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil];
    return rect.size.width;
}

@end
