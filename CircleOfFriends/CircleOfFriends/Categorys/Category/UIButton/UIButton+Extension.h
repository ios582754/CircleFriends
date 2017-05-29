//
//  UIButton+Extension.h
//  大麦
//
//  Created by 洪欣 on 16/12/13.
//  Copyright © 2016年 洪欣. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Extension)
/**  扩大buuton点击范围  */
- (void)setEnlargeEdgeWithTop:(CGFloat)top right:(CGFloat)right bottom:(CGFloat)bottom left:(CGFloat)left;
- (CGRect) enlargedRect;
- (void)setCircleButton;
- (void)setCircleBorderWithColor:(UIColor *)color;
- (void)setwidth:(CGFloat)width color:(UIColor *) color;
- (void)setwidth:(CGFloat)width;
//是否可以编辑button;
- (void)setCanTip:(BOOL)isCan;
+(UIBarButtonItem *)barBarItemstarget:(id)target action:(SEL)barItemAction ;
- (void)sd_setBackImg:(NSString *)img pleasehold:(NSString *)pleasehold;
- (void)setCircleButtonRadius:(CGFloat) radius ;
//网络加载Icon;
- (void)set_BackCircleImg:(NSString *)icon fillColor:(UIColor *)fillColor placeholder:(NSString *)placeholder ;
//button--圆形
- (void)was_setCircleImageWithUrlString:(NSString *)urlString placeholder:(UIImage *)image fillColor:(UIColor *)color forState:(UIControlState)state;
//button--圆角矩形
- (void)was_setRoundRectImageWithUrlString:(NSString *)urlString placeholder:(UIImage *)image fillColor:(UIColor *)color cornerRadius:(CGFloat) cornerRadius forState:(UIControlState)state;

//button--圆形    背景为透明 无背景色
- (void)was_setCircleImageWithUrlString:(NSString *)urlString placeholder:(UIImage *)image forState:(UIControlState)state;
//button--圆角矩形 背景为透明 无背景色
- (void)was_setRoundRectImageWithUrlString:(NSString *)urlString placeholder:(UIImage *)image cornerRadius:(CGFloat) cornerRadius forState:(UIControlState)state;

@end
