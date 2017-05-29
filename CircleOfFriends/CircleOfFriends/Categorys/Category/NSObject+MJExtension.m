//
//  NSObject+MJExtension.m
//  Day08_Beauty
//
//  Created by tarena on 16/2/4.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "NSObject+MJExtension.h"

@implementation NSObject (MJExtension)
//+(void)load {
//    [NSObject mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
//        return @{
//                 @"dec" : @"desciption",
//                 @"ID" : @"id"
//                 };
//    }];
//
//}

+ (NSString *)replacedKeyFromPropertyName:(NSString *)propertyName{
    if ([propertyName isEqualToString:@"des"]) propertyName = @"description";
    return propertyName;
}

+ (id)parse:(id)responseObj{
    if ([responseObj isKindOfClass:[NSArray class]]) {
        return [self mj_objectArrayWithKeyValuesArray:responseObj];
    }
    if ([responseObj isKindOfClass:[NSDictionary class]]) {
        return [self mj_objectWithKeyValues:responseObj];
    }
    return responseObj;
}

+ (NSDictionary *)mj_objectClassInArray{
    return [self objClassInArray];
}

+ (NSDictionary *)objClassInArray{
    return nil;
}

+ (NSString *)mj_replacedKeyFromPropertyName121:(NSString *)propertyName{
    return [self replacedKeyFromPropertyName:propertyName];
}

//+ (NSString *)replacedKeyFromPropertyName:(NSString *)propertyName{
//    return propertyName;
//}

+ (UIViewController *)getCurrentVC
{
    UIViewController *result = nil;
    
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows)
        {
            if (tmpWin.windowLevel == UIWindowLevelNormal)
            {
                window = tmpWin;
                break;
            }
        }
    }
    
    UIView *frontView = [[window subviews] objectAtIndex:0];
    id nextResponder = [frontView nextResponder];
    
    if ([nextResponder isKindOfClass:[UIViewController class]])
        result = nextResponder;
    else
        result = window.rootViewController;
    
    return result;
}


@end
