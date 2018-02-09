//
//  NSDate+TimeItem.m
//  KTTool
//
//  Created by Ki on 2018/2/9.
//  Copyright © 2018年 Ki. All rights reserved.
//

#import "NSDate+TimeItem.h"

@implementation NSDate (TimeItem)

#pragma mark - 获取当前 年月日 字符串
+ (NSString *)time_ymd{
    
    NSDate * detaildate = [NSDate date];
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc]init];
    //设定时间格式,这里可以设置成自己需要的格式
    [dateFormatter setDateFormat:@"yyyyMMdd"];
    NSString * currentDateStr = [dateFormatter stringFromDate:detaildate];
    
    return currentDateStr;
}

#pragma mark - 把YYYY-MM-dd 时间转化为 时间戳
+ (long)timeStampWithDateString:(NSString *)dateString{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    //指定时间显示样式: HH表示24小时制 hh表示12小时制
    [formatter setDateFormat:@"YYYY-MM-dd"];
    
    NSDate *lastDate = [formatter dateFromString:dateString];
    //以 1970/01/01 GMT为基准，得到lastDate的时间戳
    long timeStamp = [lastDate timeIntervalSince1970];
    
    NSLog(@"%@时间戳:%ld",dateString,timeStamp);
    
    return timeStamp * 1000;//毫秒
}


#pragma mark - 时间戳转换成时间--- M月dd日
+ (NSString *)dateFrom_TimeStamp_MyDr:(NSInteger)stampInteger{
    
    NSTimeInterval time = stampInteger/1000;//因为时差问题要加8小时 == 28800 sec
    
    NSDate * detaildate = [NSDate dateWithTimeIntervalSince1970:time];
    
    //实例化一个NSDateFormatter对象
    
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc]init];
    
    //设定时间格式,这里可以设置成自己需要的格式
    
    [dateFormatter setDateFormat:@"M月dd日"];
    
    NSString * currentDateStr = [dateFormatter stringFromDate:detaildate];
    
    return currentDateStr;
}

#pragma mark - 时间戳转换成时间---H:mm
+ (NSString *)dateFrom_TimeStamp_Hm:(NSInteger)stampInteger{
    
    NSTimeInterval time = stampInteger/1000;//因为时差问题要加8小时 == 28800 sec
    
    NSDate * detaildate = [NSDate dateWithTimeIntervalSince1970:time];
    
    //实例化一个NSDateFormatter对象
    
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc]init];
    
    //设定时间格式,这里可以设置成自己需要的格式
    
    [dateFormatter setDateFormat:@"H:mm"];
    
    NSString * currentDateStr = [dateFormatter stringFromDate:detaildate];
    
    return currentDateStr;
}

//将时间戳转换成 具体月日时分,加上时区偏移。这个转换之后是北京时间
+(NSString *)zoneChange:(NSString*)spString
{
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:[spString integerValue]/1000];
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSInteger unitFlags =  NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday |
    NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    
    NSDateComponents *comps = [calendar components:unitFlags fromDate:confromTimesp];
    
    NSInteger month = [comps month];
    NSInteger day = [comps day];
    NSInteger hour = [comps hour];
    NSInteger min = [comps minute];
    
    NSInteger week = [comps weekday];
    NSString * weekStr = @"";
    switch (week) {
        case 1:
            weekStr = @"周日";
            break;
        case 2:
            weekStr = @"周一";
            break;
        case 3:
            weekStr = @"周二";
            break;
        case 4:
            weekStr = @"周三";
            break;
        case 5:
            weekStr = @"周四";
            break;
        case 6:
            weekStr = @"周五";
            break;
        case 7:
            weekStr = @"周六";
            break;
            
            
        default:
            break;
    }
    
    NSString *string = [NSString stringWithFormat:@"%ld/%ld(%@)%ld:%ld",(long)month,(long)day,weekStr,(long)hour,(long)min];
    return string;
}

//将时间戳转换成 具体时分,加上时区偏移。这个转换之后是北京时间
+(NSString *)endTimeChange:(NSString*)spString
{
    NSInteger timeStamp = [spString integerValue]/1000;
    
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:timeStamp];
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSInteger unitFlags =  NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday |
    NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    
    NSDateComponents *comps = [calendar components:unitFlags fromDate:confromTimesp];
    
    NSInteger hour = [comps hour];
    NSInteger min = [comps minute];
    
    NSString *string = [NSString stringWithFormat:@"~%ld:%ld",(long)hour,(long)min];
    
    return string;
}

@end
