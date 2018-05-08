//
//  NSDate+Stamp.m
//  KTTool
//
//  Created by Ki on 2018/4/26.
//  Copyright © 2018年 Ki. All rights reserved.
//
///

/*
 NSDate -- 表示一个绝对的时间点, 表示公历的GMT时间(格林威治时间)。 2019-02-14 08:57:20 +0000
 NSTimeZone -- 时区信息
 NSLocale -- 本地化信息
 NSDateComponents -- 一个封装了具体年月日、时秒分、周、季度等的类
 NSCalendar -- 日历类，它提供了大部分的日期计算接口，并且允许您在NSDate和NSDateComponents之间转换
 NSDateFormatter -- 用来在日期和字符串之间转换
 */
#import "NSDate+Stamp.h"

@implementation NSDate (Stamp)


#pragma mark - 获取当前 年月日 字符串
+ (NSString *)getCurrentTimeWithFormatter:(NSString *)formatter{
    formatter = @"yyyyMM";//
    NSDate * detaildate = [NSDate date];
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc]init];
    //设定时间格式,这里可以设置成自己需要的格式
    [dateFormatter setDateFormat:formatter];
    NSString * currentDateStr = [dateFormatter stringFromDate:detaildate];
    return currentDateStr;
}

#pragma mark - 时间戳转换成时间
+ (NSString *)dateFrom_TimeStamp:(NSInteger)stampInteger DateFormatter:(NSString *)formatStr{
    //NSString * str = @"1368082020";//时间戳
    formatStr = @"yyyy年M月dd日";
    NSTimeInterval time = stampInteger/1000;//因为时差问题要加8小时 == 28800 sec
    NSDate * detaildate = [NSDate dateWithTimeIntervalSince1970:time];
    //实例化一个NSDateFormatter对象
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc]init];
    //设定时间格式,这里可以设置成自己需要的格式
    [dateFormatter setDateFormat:formatStr];
    NSString * currentDateStr = [dateFormatter stringFromDate:detaildate];
    return currentDateStr;
}

#pragma mark - 把YYYY-MM-dd 时间字符串转化为 时间戳
+ (long)timeStampWithDateString:(NSString *)dateString{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY-MM-dd"];//指定时间显示样式: HH表示24小时制 hh表示12小时制
    
    NSDate *lastDate = [formatter dateFromString:dateString];
    long timeStamp = [lastDate timeIntervalSince1970];//以 1970/01/01 GMT为基准，得到lastDate的时间戳
    return timeStamp * 1000;//毫秒
}

#pragma mark  - 年月日 转换为 周几
+ (NSString *)getWeekDay:(NSString*)currentStr{
    NSDateFormatter* dateFormat = [[NSDateFormatter alloc]init];//实例化一个NSDateFormatter对象
    [dateFormat setDateFormat:@"yyyy-MM-dd"];//设定时间格式,要注意跟下面的dateString匹配，否则日起将无效
    NSDate*date =[dateFormat dateFromString:currentStr];
    NSArray*weekdays = [NSArray arrayWithObjects: [NSNull null],@"周日",@"周一",@"周二",@"周三",@"周四",@"周五",@"周六",nil];
    NSCalendar* calendar = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSTimeZone*timeZone = [[NSTimeZone alloc]initWithName:@"Asia/Shanghai"];
    [calendar setTimeZone: timeZone];
    NSCalendarUnit calendarUnit =NSCalendarUnitWeekday;
    NSDateComponents* theComponents = [calendar components:calendarUnit fromDate:date];
    return [weekdays objectAtIndex:theComponents.weekday];
}

#pragma mark - 时间段
+ (NSString *)gradeStarTime:(NSString *)starTime EndTime:(NSString *)endTime{
    
    NSDateComponents * startComps = [self dateComponents:starTime];
    NSDateComponents * endComps = [self dateComponents:endTime];
    
    NSInteger sMonth = [startComps month];
    NSInteger sDay = [startComps day];
    NSInteger sHour = [startComps hour];
    NSInteger sMin = [startComps minute];
    
    NSInteger eMonth = [endComps month];
    NSInteger eDay = [endComps day];
    NSInteger eHour = [endComps hour];
    NSInteger eMin = [endComps minute];
    
    NSString * timeStr = [NSString stringWithFormat:@"%02ld/%02ld-%02ld/%02ld %02ld:%02ld~%02ld:%02ld",sMonth,sDay,eMonth,eDay,sHour,sMin,eHour,eMin];
    return timeStr;
}

#pragma mark - 把时间转位时间组件
+ (NSDateComponents *)dateComponents:(NSString *)time{
    
    NSInteger timeStamp = [time integerValue]/1000;
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:timeStamp];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSInteger unitFlags =  NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday |
    NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *comps = [calendar components:unitFlags fromDate:confromTimesp];
    return comps;
}
@end







