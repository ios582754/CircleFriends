//
//  NSString+Extensions.h
//  CircleOfFriends
//
//  Created by apple on 17/5/29.
//  Copyright © 2017年 pxymac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Extensions)
- (NSDate *)stringToDate ;
- (BOOL)stringIsEmpty;
+ (NSArray *)arrayWithJsonString:(NSString *)jsonString;
+(NSString *)stringTOjson:(id)temps;
- (NSString *)trimming;
@end
