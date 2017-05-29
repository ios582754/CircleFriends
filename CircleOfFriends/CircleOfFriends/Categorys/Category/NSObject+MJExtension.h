//
//  NSObject+MJExtension.h
//  Day08_Beauty
//
//  Created by tarena on 16/2/4.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJExtension.h"

@interface NSObject (MJExtension)
+ (id)parse:(id)responseObj;
+ (NSDictionary *)objClassInArray;
//mj_replacedKeyFromPropertyName121:和replaceKeyFromPropertyName方法有冲突, 使用了前者,则后者失效. 选择只使用前者来做key和属性名对应操作.
+ (NSString *)replacedKeyFromPropertyName:(NSString *)propertyName;

//+ (NSDictionary *)replacedKeyFromPropertyName;


+ (UIViewController *)getCurrentVC;

@end






