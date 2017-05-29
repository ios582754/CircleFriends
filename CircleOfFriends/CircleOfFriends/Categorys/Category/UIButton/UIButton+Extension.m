//
//  UIButton+Extension.m
//  大麦
//
//  Created by 洪欣 on 16/12/13.
//  Copyright © 2016年 洪欣. All rights reserved.
//

#import "UIButton+Extension.h"
#import <objc/runtime.h>
#import "UIButton+WebCache.h"
#import "UIImage+Extension.h"
static char topNameKey;
static char rightNameKey;
static char bottomNameKey;
static char leftNameKey;
@implementation UIButton (Extension)
- (void)setEnlargeEdgeWithTop:(CGFloat)top right:(CGFloat)right bottom:(CGFloat)bottom left:(CGFloat)left
{
    objc_setAssociatedObject(self, &topNameKey, [NSNumber numberWithFloat:top], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &rightNameKey, [NSNumber numberWithFloat:right], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &bottomNameKey, [NSNumber numberWithFloat:bottom], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &leftNameKey, [NSNumber numberWithFloat:left], OBJC_ASSOCIATION_COPY_NONATOMIC);
}
- (CGRect) enlargedRect
{
    NSNumber* topEdge = objc_getAssociatedObject(self, &topNameKey);
    NSNumber* rightEdge = objc_getAssociatedObject(self, &rightNameKey);
    NSNumber* bottomEdge = objc_getAssociatedObject(self, &bottomNameKey);
    NSNumber* leftEdge = objc_getAssociatedObject(self, &leftNameKey);
    if (topEdge && rightEdge && bottomEdge && leftEdge)
    {
        return CGRectMake(self.bounds.origin.x - leftEdge.floatValue,
                          self.bounds.origin.y - topEdge.floatValue,
                          self.bounds.size.width + leftEdge.floatValue + rightEdge.floatValue,
                          self.bounds.size.height + topEdge.floatValue + bottomEdge.floatValue);
    }
    else
    {
        return self.bounds;
    }
}

- (UIView*) hitTest:(CGPoint) point withEvent:(UIEvent*) event
{
    CGRect rect = [self enlargedRect];
    if (CGRectEqualToRect(rect, self.bounds))
    {
        return [super hitTest:point withEvent:event];
    }
    return CGRectContainsPoint(rect, point) ? self : nil;
}
- (void)setCircleButton {
    [self.layer setMasksToBounds:YES];//设置按钮的圆角半径不会被遮挡
    
    [self.layer setCornerRadius:self.height/2];
    //    self.clipsToBounds = YES;
    
    //    [self.layer setBorderWidth:1];//设置边界的宽度
}

- (void)setCircleButtonRadius:(CGFloat) radius {
    [self.layer setMasksToBounds:YES];//设置按钮的圆角半径不会被遮挡
    
    [self.layer setCornerRadius:radius];
    self.clipsToBounds = YES;
}

- (void)setCircleBorderWithColor:(UIColor *)color {
    [self.layer setMasksToBounds:YES];//设置按钮的圆角半径不会被遮挡
    
    [self.layer setCornerRadius:self.height/2];
    
    [self.layer setBorderWidth:1];//设置边界的宽度
    
    //设置按钮的边界颜色
    
    //    CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceRGB();
    //
    //    CGColorRef color = CGColorCreate(colorSpaceRef, components);
    
    [self.layer setBorderColor:color.CGColor];
}


- (void)setwidth:(CGFloat)width color:(UIColor *) color {
    
    self.layer.cornerRadius = width;
    self.layer.masksToBounds = YES;
    self.layer.borderColor = color.CGColor;
    self.layer.borderWidth = 1.0;
    
}

- (void)setwidth:(CGFloat)width {
    
    self.layer.cornerRadius = width;
    self.layer.masksToBounds = YES;
    //    self.layer.borderColor = color.CGColor;
    self.layer.borderWidth = 0;
    
}

- (void)setCanTip:(BOOL)isCan {
    if (!isCan) {
        self.userInteractionEnabled = NO;
        self.backgroundColor = [UIColor lightGrayColor];
        [self setwidth:5.0 color:[UIColor whiteColor]];
        self.alpha = 0.3;
    } else {
        self.userInteractionEnabled = YES;
        [self setwidth:5. color:[UIColor whiteColor]];
        self.backgroundColor = [UIColor redColor];
        self.alpha = 1.0;
    }
}

+(UIBarButtonItem *)barBarItemstarget:(id)target action:(SEL)barItemAction  {
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame=CGRectMake(0, 0, 15, 23);
    [backBtn setBackgroundImage:[UIImage imageNamed:@"navigation_back"] forState:0];
    [backBtn addTarget:target action:barItemAction forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftBarItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    return leftBarItem;
}

- (void)sd_setBackImg:(NSString *)img pleasehold:(NSString *)pleasehold {
    // (void)setBackgroundImageWithURL:(NSURL *)url forState:(UIControlState)state
    
    [self  sd_setImageWithURL:[NSURL URLWithString:PXY_STR(@"%@%@",baseImageUrl,img)] forState:UIControlStateNormal];
    
}
- (void)set_BackCircleImg:(NSString *)icon fillColor:(UIColor *)fillColor placeholder:(NSString *)placeholder  {
    if (icon == nil) {
        [self setImage:[UIImage imageNamed:@"certification_nol"] forState:UIControlStateNormal];
    } else{
        NSString *str = PXY_STR(@"%@%@",baseImageUrl,icon);
        [self was_setCircleImageWithUrlString:str placeholder:nil fillColor:fillColor forState:UIControlStateNormal];
    }
}


//圆形
- (void)was_setCircleImageWithUrlString:(NSString *)urlString placeholder:(UIImage *)image fillColor:(UIColor *)color forState:(UIControlState)state {
    [self was_setCircleImageWithUrlString:urlString placeholder:image fillColor:color opaque:color forState:state];
}

//button--圆形    背景为透明 无背景色
- (void)was_setCircleImageWithUrlString:(NSString *)urlString placeholder:(UIImage *)image forState:(UIControlState)state{
    [self was_setCircleImageWithUrlString:urlString placeholder:image fillColor:nil opaque:NO forState:state];
}

//圆角矩阵
- (void)was_setRoundRectImageWithUrlString:(NSString *)urlString placeholder:(UIImage *)image fillColor:(UIColor *)color cornerRadius:(CGFloat) cornerRadius forState:(UIControlState)state{
    
    [self was_setRoundRectImageWithUrlString:urlString placeholder:image fillColor:color opaque:color cornerRadius:cornerRadius forState:state];
}

//button--圆角矩形 背景为透明 无背景色
- (void)was_setRoundRectImageWithUrlString:(NSString *)urlString placeholder:(UIImage *)image cornerRadius:(CGFloat) cornerRadius forState:(UIControlState)state{
    [self was_setRoundRectImageWithUrlString:urlString placeholder:image fillColor:nil opaque:NO cornerRadius:cornerRadius forState:state];
}

- (void)was_setRoundRectImageWithUrlString:(NSString *)urlString placeholder:(UIImage *)image fillColor:(UIColor *)color opaque:(BOOL)opaque cornerRadius:(CGFloat) cornerRadius forState:(UIControlState)state{
    NSURL *url = [NSURL URLWithString:urlString];
    [self.superview layoutIfNeeded];
    __weak typeof(self) weakSelf = self;
    CGSize size = self.frame.size;
    
    if (image) {
        //占位图片不为空的情况
        //占位处理
        [image was_roundRectImageWithSize:size fillColor:color opaque:opaque radius:cornerRadius completion:^(UIImage *roundRectPlaceHolder) {
            //sd
            [weakSelf sd_setImageWithURL:url forState:state placeholderImage:roundRectPlaceHolder completed:^(UIImage *img, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                //3.如果下载成功那么讲下载成功的图进行圆角化
                [img was_roundRectImageWithSize:size fillColor:color opaque:opaque radius:cornerRadius completion:^(UIImage *roundRectImage) {
                    [weakSelf setImage:roundRectImage forState:state];
                }];
                
            }];
            
        }];
    } else {
        //占位图片为空的情况
        [weakSelf sd_setImageWithURL:url forState:state placeholderImage:nil completed:^(UIImage *img, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            //3.如果下载成功那么讲下载成功的图进行圆角化
            [img was_roundRectImageWithSize:size fillColor:color opaque:opaque radius:cornerRadius completion:^(UIImage *roundRectImage) {
                [weakSelf setImage:roundRectImage forState:state];
            }];
            
        }];
    }
    
}

- (void)was_setCircleImageWithUrlString:(NSString *)urlString placeholder:(UIImage *)image fillColor:(UIColor *)color opaque:(BOOL)opaque forState:(UIControlState)state{
    NSURL *url = [NSURL URLWithString:urlString];
    [self.superview layoutIfNeeded];
    __weak typeof(self) weakSelf = self;
    CGSize size = self.frame.size;
    
    if (image) {
        //占位图片不为空的情况
        //占位处理
        [image was_roundImageWithSize:size fillColor:color opaque:opaque completion:^(UIImage *radiusPlaceHolder) {
            //sd
            [weakSelf sd_setImageWithURL:url forState:state placeholderImage:radiusPlaceHolder completed:^(UIImage *img, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                //3.如果下载成功那么讲下载成功的图进行圆角化
                [img was_roundImageWithSize:size fillColor:color opaque:opaque completion:^(UIImage *radiusImage) {
                    [weakSelf setImage:radiusImage forState:state];
                }];
                
            }];
            
        }];
    } else {
        //占位图片为空的情况
        [weakSelf sd_setImageWithURL:url forState:state placeholderImage:nil completed:^(UIImage *img, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            //3.如果下载成功那么讲下载成功的图进行圆角化
            [img was_roundImageWithSize:size fillColor:color opaque:opaque completion:^(UIImage *radiusImage) {
                [weakSelf setImage:radiusImage forState:state];
            }];
            
        }];
    }
    
}

@end
