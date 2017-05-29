//
//  NSString+Extensions.m
//  CircleOfFriends
//
//  Created by apple on 17/5/29.
//  Copyright © 2017年 pxymac. All rights reserved.
//

#import "NSString+Extensions.h"

@implementation NSString (Extensions)
- (NSDate *)stringToDate {
    NSDate* inputDate = nil;
    NSString* string = self;
    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init] ;
    [inputFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"] ];
    [inputFormatter setDateFormat:@"yyyyMMddHHmmss"];
    inputDate = [inputFormatter dateFromString:string];
    return inputDate;
}

//判断是否为空
- (BOOL)stringIsEmpty{
    if([self isKindOfClass:[NSNull class]]){
        return YES;
    }
    NSString *text = [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if ([text length] == 0) {
        return YES;
    }
    return NO;
}

+(NSString *)stringTOjson:(id)temps   //把字典和数组转换成json字符串
{
    NSData* jsonData =[NSJSONSerialization dataWithJSONObject:temps
                                                      options:NSJSONWritingPrettyPrinted error:nil];
    NSString *strs=[[NSString alloc] initWithData:jsonData
                                         encoding:NSUTF8StringEncoding];
    return strs;
}

+ (NSArray *)arrayWithJsonString:(NSString *)jsonString {
    
    if (jsonString == nil) {
        return nil;
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    
    NSError *err;
    
    NSArray *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                    
                                                   options:NSJSONReadingMutableContainers
                    
                                                     error:&err];
    
    if(err) {
        
        NSLog(@"json解析失败：%@",err);
        
        return nil;
        
    }
    
    return dic;
    
}

- (NSString *)trimming {
    NSString *neStr = [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    return neStr;
}
@end
