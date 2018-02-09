//
//  CALayer+Line.m
//  KTTool
//
//  Created by Ki on 2018/2/9.
//  Copyright © 2018年 Ki. All rights reserved.
//

#import "CALayer+Line.h"
#import <UIKit/UIKit.h>

@implementation CALayer (Line)


+ (CALayer *)lineHorizonLayerWithFrame:(CGRect)frame Color:(UIColor *)color{
    
    CALayer * lineLayer = [[CALayer alloc] init];
    lineLayer.backgroundColor = color.CGColor;
    CGFloat x = frame.origin.x;
    CGFloat y = frame.origin.y;
    CGFloat w = frame.size.width;
    
    lineLayer.frame = CGRectMake(x,y,w,1/[[UIScreen mainScreen] scale]);
    return lineLayer;
}

+ (CALayer *)lineVirLayerWithFrame:(CGRect)frame Color:(UIColor *)color{
    
    CALayer * lineLayer = [[CALayer alloc] init];
    lineLayer.backgroundColor = color.CGColor;
    CGFloat x = frame.origin.x;
    CGFloat y = frame.origin.y;
    CGFloat h = frame.size.height;
    
    lineLayer.frame = CGRectMake(x,y,1/[[UIScreen mainScreen] scale],h);
    
    return lineLayer;
}


@end
