//
//  KTDevice.h
//  KTVideo
//
//  Created by Ki on 2018/10/11.
//  Copyright © 2018 Ki. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger,DeviceType) {
    
    Unknown = 0,
    Simulator,
    IPhone_1G,          //基本不用
    IPhone_3G,          //基本不用
    IPhone_3GS,         //基本不用
    IPhone_4,           //基本不用
    IPhone_4s,          //基本不用
    IPhone_5,
    IPhone_5C,
    IPhone_5S,
    IPhone_SE,
    IPhone_6,
    IPhone_6P,
    IPhone_6s,
    IPhone_6s_P,
    IPhone_7,
    IPhone_7P,
    IPhone_8,
    IPhone_8P,
    IPhone_X,
    IPhone_XS,
    IPhone_XR,
    IPhone_XM,
};

NS_ASSUME_NONNULL_BEGIN

@interface KTDevice : NSObject



+ (DeviceType)deviceType;

@end

NS_ASSUME_NONNULL_END
