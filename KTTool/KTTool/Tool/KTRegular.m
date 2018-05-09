//
//  KTRegular.m
//  KTTool
//
//  Created by Ki on 2018/5/9.
//  Copyright © 2018年 Ki. All rights reserved.
//

#import "KTRegular.h"

@implementation KTRegular

#pragma mark - 判断字符数 判断字符串为6～12位“字符”
+ (BOOL)isValidateName:(NSString *)name{
    NSUInteger  character = 0;
    for(int i=0; i< [name length];i++){
        int a = [name characterAtIndex:i];
        if( a >= 0x4e00 && a <= 0x9fa5){ //判断是否为中文
            character +=2;
        }else{
            character +=1;
            return NO; //非中文
        }
    }
    
    if (character >=4 && character <=20) {
        return YES;
    }else{
        return NO;
    }
    
}

#pragma mark - 判断是否为英文名
+ (BOOL)english:(NSString *)englishName{
    
    NSInteger alength = [englishName length];
    
    if(alength > 20 || alength < 2)
    {
        return NO;
    }
    
    for (int i = 0; i<alength; i++) {
        char commitChar = [englishName characterAtIndex:i];
        NSString *temp = [englishName substringWithRange:NSMakeRange(i,1)];
        const char *u8Temp = [temp UTF8String];
        if (3==strlen(u8Temp)){
            
            NSLog(@"字符串中含有中文");
            return NO;
        }else if((commitChar>64)&&(commitChar<91)){
            
            NSLog(@"字符串中含有大写英文字母");
        }else if((commitChar>96)&&(commitChar<123)){
            
            NSLog(@"字符串中含有小写英文字母");
            
        }else if((commitChar>47)&&(commitChar<58)){
            
            NSLog(@"字符串中含有数字");
            
            return NO;
        }else{
            NSLog(@"字符串中含有非法字符");
            return NO;
        }
    }
    return YES;
}


#pragma mark - 判断邮箱号 如果符合邮箱格式，返回YES
+ (BOOL)isValidateEmail:(NSString *)email {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

#pragma mark - 判断密码为6～20位字符
+ (BOOL)isValidatePassword:(NSString *)password{
    NSString *regex = @"^[\x21-\x7E]{6,20}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pred evaluateWithObject:password];
}

#pragma mark - 判断手机格式
+ (BOOL)checkTel:(NSString *)str{
    NSString *regex = @"^[1][3-8]+\\d{9}"; /*手机号码变化大，所以没有做更精确*/
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return  [pred evaluateWithObject:str];;
}

#pragma mark - 判断邮编格式为6位数字
+ (BOOL)checkPostCode:(NSString *)str{
    NSString *regex = @"^[0-9]{6}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return  [pred evaluateWithObject:str];
}

#pragma mark - 身份证号
+ (BOOL)validateIdentityCard:(NSString *)IDCardNumber{
    NSString *regex = @"^(\\d{18,18}|\\d{15,15}|\\d{17,17}(x|X))$";
    
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    
    return [identityCardPredicate evaluateWithObject:IDCardNumber];
}

@end
