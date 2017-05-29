//
//  UIImage+Extension.h
//  大麦
//
//  Created by 洪欣 on 16/12/13.
//  Copyright © 2016年 洪欣. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)
- (UIImage *)imageWithColor:(UIColor *)color;
- (UIImage *)coreImageBlurNumber:(CGFloat)blur;
- (UIImage *)boxblurWithBlurNumber:(CGFloat)blur;
/**
 *  用颜色生成指定大小的图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;
-(UIImage*)imageWithCornerRadius:(CGFloat)radius;
//圆形
- (void)was_roundImageWithSize:(CGSize)size fillColor:(UIColor *)fillColor opaque:(BOOL)opaque completion:(void (^)(UIImage *))completion;
//圆角矩阵
- (void)was_roundRectImageWithSize:(CGSize)size fillColor:(UIColor *)fillColor opaque:(BOOL)opaque radius:(CGFloat)radius completion:(void (^)(UIImage *))completion;
@end
