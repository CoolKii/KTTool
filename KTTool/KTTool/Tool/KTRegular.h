//
//  KTRegular.h
//  KTTool
//
//  Created by Ki on 2018/5/9.
//  Copyright © 2018年 Ki. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface KTRegular : NSObject

#pragma mark - 判断字符数 判断字符串为6～12位“字符”
+ (BOOL)isValidateName:(NSString *)name;

#pragma mark - 判断是否为英文名
+ (BOOL)english:(NSString *)englishName;

#pragma mark - 判断邮箱号 如果符合邮箱格式，返回YES
+ (BOOL)isValidateEmail:(NSString *)email ;

#pragma mark - 判断密码为6～20位字符
+ (BOOL)isValidatePassword:(NSString *)password;

#pragma mark - 判断手机格式
+ (BOOL)checkTel:(NSString *)str;

#pragma mark - 判断邮编格式为6位数字
+ (BOOL)checkPostCode:(NSString *)str;

#pragma mark - 身份证号
+ (BOOL)validateIdentityCard:(NSString *)IDCardNumber;

@end


