//
//  KTQrCode.h
//  KTTool
//
//  Created by Ki on 2018/5/9.
//  Copyright © 2018年 Ki. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface KTQrCode : NSObject

/**
 *  创建二维码图片
 *  UIImage * codeImg = [KTQrCode createQRCodeImageWithStr:self.codeString andSize:100];//100x100正方形
 */
+ (UIImage *)createQRCodeImageWithStr:(NSString *)str andSize:(CGFloat)size;
- (UIImage*)imageBlackToTransparent:(UIImage*)image withRed:(CGFloat)red andGreen:(CGFloat)green andBlue:(CGFloat)blue;


@end
