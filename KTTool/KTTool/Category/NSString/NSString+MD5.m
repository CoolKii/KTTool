//
//  NSString+MD5.m
//  PKWSevers
//
//  Created by peikua on 16/4/27.
//  Copyright © 2016年 peikua. All rights reserved.
//

#import "NSString+MD5.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (MD5)

- (NSString *) md5WithString
{
    if (self==nil || [self length]==0) {
        return nil;
    }
    
    const char *value = [self UTF8String];
    
    unsigned char outputBuffer[CC_MD5_DIGEST_LENGTH];
    CC_MD5(value, (CC_LONG)strlen(value), outputBuffer);
    
    NSMutableString *outputString = [[NSMutableString alloc] initWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for (NSInteger count=0; count<CC_MD5_DIGEST_LENGTH; count++) {
        [outputString appendFormat:@"%02x", outputBuffer[count]];
    }
    
    return outputString;
}


- (NSString *)md5{
    
    const char *cStr = [self UTF8String];
    unsigned char result[16];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result);
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

@end
