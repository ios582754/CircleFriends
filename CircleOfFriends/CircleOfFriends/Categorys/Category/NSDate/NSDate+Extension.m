//
//  NSDate+Extension.m
//  大麦
//
//  Created by 洪欣 on 16/12/22.
//  Copyright © 2016年 洪欣. All rights reserved.
//

#import "NSDate+Extension.h"

@implementation NSDate (Extension)

+ (NSString *)getCurrentDate
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *dateTime = [formatter stringFromDate:[self date]];
    return dateTime;
}

+ (NSString *)getTomorrowDay
{
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *components = [gregorian components:NSCalendarUnitWeekday | NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:[self date]];
    [components setDay:([components day]+1)];
    
    NSDate *beginningOfWeek = [gregorian dateFromComponents:components];
    NSDateFormatter *dateday = [[NSDateFormatter alloc] init];
    [dateday setDateFormat:@"yyyy-MM-dd"];
    return [dateday stringFromDate:beginningOfWeek];
}

+ (NSString *)getWeekDate
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *nextDate = [NSDate dateWithTimeInterval:24*60*60*7 sinceDate:[NSDate date]];
    NSString *dateTime = [formatter stringFromDate:nextDate];
    return dateTime;
}

+ (NSString *)getAfterTomorrowDate
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *nextDate = [NSDate dateWithTimeInterval:24*60*60*2 sinceDate:[NSDate date]];
    NSString *dateTime = [formatter stringFromDate:nextDate];
    return dateTime;
}

+ (NSString *)getMonthDate
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *nextDate = [NSDate dateWithTimeInterval:24*60*60*30 sinceDate:[NSDate date]];
    NSString *dateTime = [formatter stringFromDate:nextDate];
    return dateTime;
}
- (NSInteger)year {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitYear fromDate:self] year];
}

- (NSInteger)month {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitMonth fromDate:self] month];
}

- (NSInteger)day {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitDay fromDate:self] day];
}

- (NSInteger)hour {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitHour fromDate:self] hour];
}

- (NSInteger)minute {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitMinute fromDate:self] minute];
}

- (NSInteger)second {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitSecond fromDate:self] second];
}

- (NSInteger)nanosecond {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitSecond fromDate:self] nanosecond];
}

- (NSInteger)weekday {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitWeekday fromDate:self] weekday];
}

- (NSInteger)weekdayOrdinal {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitWeekdayOrdinal fromDate:self] weekdayOrdinal];
}

- (NSInteger)weekOfMonth {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitWeekOfMonth fromDate:self] weekOfMonth];
}

- (NSInteger)weekOfYear {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitWeekOfYear fromDate:self] weekOfYear];
}

- (NSInteger)yearForWeekOfYear {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitYearForWeekOfYear fromDate:self] yearForWeekOfYear];
}

- (NSInteger)quarter {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitQuarter fromDate:self] quarter];
}

- (BOOL)isLeapMonth {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitQuarter fromDate:self] isLeapMonth];
}

- (BOOL)isLeapYear {
    NSUInteger year = self.year;
    return ((year % 400 == 0) || ((year % 100 != 0) && (year % 4 == 0)));
}

- (BOOL)isToday {
    if (fabs(self.timeIntervalSinceNow) >= 60 * 60 * 24) return NO;
    return [NSDate new].day == self.day;
}

- (BOOL)isYesterday {
    NSDate *added = [self dateByAddingDays:1];
    return [added isToday];
}
- (NSDate *)getNowDateFromatAnDate:(NSDate *)anyDate
{
    //设置源日期时区
    NSTimeZone* sourceTimeZone = [NSTimeZone timeZoneWithAbbreviation:@"UTC"];//或GMT
    //设置转换后的目标日期时区
    NSTimeZone* destinationTimeZone = [NSTimeZone localTimeZone];
    //得到源日期与世界标准时间的偏移量
    NSInteger sourceGMTOffset = [sourceTimeZone secondsFromGMTForDate:anyDate];
    //目标日期与本地时区的偏移量
    NSInteger destinationGMTOffset = [destinationTimeZone secondsFromGMTForDate:anyDate];
    //得到时间偏移量的差值
    NSTimeInterval interval = destinationGMTOffset - sourceGMTOffset;
    //转为现在时间
    NSDate* destinationDateNow = [[NSDate alloc] initWithTimeInterval:interval sinceDate:anyDate] ;
    return destinationDateNow;
}
-(NSString *)getLocalDateFormateUTCDate:(NSString *)utcDate
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //输入格式
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZ"];
    NSTimeZone *localTimeZone = [NSTimeZone localTimeZone];
    [dateFormatter setTimeZone:localTimeZone];
    
    NSDate *dateFormatted = [dateFormatter dateFromString:utcDate];
    //输出格式
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *dateString = [dateFormatter stringFromDate:dateFormatted];
    return dateString;
}
- (NSDate *)dateByAddingYears:(NSInteger)years {
    NSCalendar *calendar =  [NSCalendar currentCalendar];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setYear:years];
    return [calendar dateByAddingComponents:components toDate:self options:0];
}

- (NSDate *)dateByAddingMonths:(NSInteger)months {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setMonth:months];
    return [calendar dateByAddingComponents:components toDate:self options:0];
}

- (NSDate *)dateByAddingWeeks:(NSInteger)weeks {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setWeekOfYear:weeks];
    return [calendar dateByAddingComponents:components toDate:self options:0];
}

- (NSDate *)dateByAddingDays:(NSInteger)days {
    NSTimeInterval aTimeInterval = [self timeIntervalSinceReferenceDate] + 86400 * days;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

- (NSDate *)dateByAddingHours:(NSInteger)hours {
    NSTimeInterval aTimeInterval = [self timeIntervalSinceReferenceDate] + 3600 * hours;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

- (NSDate *)dateByAddingMinutes:(NSInteger)minutes {
    NSTimeInterval aTimeInterval = [self timeIntervalSinceReferenceDate] + 60 * minutes;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

- (NSDate *)dateByAddingSeconds:(NSInteger)seconds {
    NSTimeInterval aTimeInterval = [self timeIntervalSinceReferenceDate] + seconds;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

- (NSString *)stringWithFormat:(NSString *)format {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    [formatter setLocale:[NSLocale currentLocale]];
    return [formatter stringFromDate:self];
}

- (NSString *)stringWithFormat:(NSString *)format timeZone:(NSTimeZone *)timeZone locale:(NSLocale *)locale {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    if (timeZone) [formatter setTimeZone:timeZone];
    if (locale) [formatter setLocale:locale];
    return [formatter stringFromDate:self];
}

- (NSString *)stringWithISOFormat {
    static NSDateFormatter *formatter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        formatter = [[NSDateFormatter alloc] init];
        formatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
        formatter.dateFormat = @"yyyy-MM-dd HH:mm:ssZ";
    });
    return [formatter stringFromDate:self];
}

+ (NSDate *)dateWithString:(NSString *)dateString format:(NSString *)format {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    return [formatter dateFromString:dateString];
}

+ (NSDate *)dateWithString:(NSString *)dateString format:(NSString *)format timeZone:(NSTimeZone *)timeZone locale:(NSLocale *)locale {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    if (timeZone) [formatter setTimeZone:timeZone];
    if (locale) [formatter setLocale:locale];
    return [formatter dateFromString:dateString];
}

+ (NSDate *)dateWithISOFormatString:(NSString *)dateString {
    static NSDateFormatter *formatter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        formatter = [[NSDateFormatter alloc] init];
        formatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
        formatter.dateFormat = @"yyyy-MM-dd HH:mm:ssZ";
    });
    return [formatter dateFromString:dateString];
}

+ (NSDate *)getLocalFromUTC:(NSString *)utc
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    NSTimeZone *timeZone = [NSTimeZone localTimeZone];
    [dateFormatter setTimeZone:timeZone];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss Z"];
    NSDate *ldate = [dateFormatter dateFromString:utc];
    
    return ldate;
}


@end
