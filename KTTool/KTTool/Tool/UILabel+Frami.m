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

#pragma mark - 计算文字长度
- (float)widthForString:(NSString *)value fontSize:(float)fontSize andHeight:(float)height{
    
    NSDictionary *attribute = @{NSFontAttributeName: [UIFont systemFontOfSize:fontSize]};
    
    CGSize size = [value boundingRectWithSize:CGSizeMake(MAXFLOAT,height) options: NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
    
    return size.width;
    
}

#pragma mark - 计算文本高度
- (CGFloat)calculateheightWithString:(NSString *)string FontSize:(CGFloat)size Width:(CGFloat)width{
    
    // 段落设置与实际显示的 Label 属性一致 采用 NSMutableParagraphStyle 设置Nib 中 Label 的相关属性传入到 NSAttributeString 中计算；
    
    NSMutableParagraphStyle *style = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    style.lineBreakMode = NSLineBreakByWordWrapping;
    style.alignment = NSTextAlignmentLeft;
    
    NSAttributedString * attString = [[NSAttributedString alloc]initWithString:string attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:size], NSParagraphStyleAttributeName:style}];
    
    CGSize strSize =  [attString boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context:nil].size;
    
    NSLog(@" size =  %@", NSStringFromCGSize(strSize));
    
    // 并不是高度计算不对，我估计是计算出来的数据是 小数，在应用到布局的时候稍微差一点点就不能保证按照计算时那样排列，所以为了确保布局按照我们计算的数据来，就在原来计算的基础上 取ceil值，再加1；
    CGFloat height = ceil(strSize.height) + 1;
    
    return height;
}

#pragma mark - 两个字符串之前AttributeString
+ (NSMutableAttributedString *)attributeStr:(NSString *)string PrefixStr:(NSString *)prefixStr SuffixStr:(NSString *)suffixStr{
    
    NSRange xRange = [string rangeOfString:prefixStr];
    NSRange yRange = [string rangeOfString:suffixStr];
    
    //创建NSMutableAttributedString
    NSMutableAttributedString * attrStr = [[NSMutableAttributedString alloc]initWithString:string];
    NSUInteger theLocation = xRange.location;
    NSUInteger theLength = yRange.location - xRange.location;
    NSRange theRange = NSMakeRange(theLocation + 1, theLength - 1);
    
    //设置字体和设置字体的范围
    [attrStr addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"PingFang TC" size:14.0f] range:theRange];
    [attrStr addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:theRange];//149EFF
    
    return attrStr;
}

#pragma mark - 首行缩进
+ (NSAttributedString *)firstLineAttrText:(NSString *)nameStr{
    
    NSMutableParagraphStyle *style = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    // 对齐方式
    style.alignment = NSTextAlignmentJustified;
    // 首行缩进
    style.firstLineHeadIndent = -10.0f;
    // 头部缩进
    style.headIndent = 6.5f;
    //行间距
    [style setLineSpacing:10];
    
    NSMutableAttributedString *attrText = [[NSMutableAttributedString alloc] initWithString:nameStr attributes:@{ NSParagraphStyleAttributeName : style}];
    
    return attrText;
}

@end
