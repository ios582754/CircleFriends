//
//  UIImageView+Extension.m
//  大麦
//
//  Created by 洪欣 on 16/12/20.
//  Copyright © 2016年 洪欣. All rights reserved.
//

#import "UIImageView+Extension.h"
#import "UIImage+Extension.h"
#import "UIImageView+WebCache.h"
@implementation UIImageView (Extension)
- (void)CircleImageVIew {
       UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:self.bounds.size];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc]init];
    //设置大小
    maskLayer.frame = self.bounds;
    //设置图形样子
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}
//一般的加载图片;
- (void)sd_setImage:(NSString *)img pleasehold:(NSString *) pleasehold {
 [self sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",baseImageUrl,img]]placeholderImage: [UIImage imageNamed:pleasehold]];

}
- (void)sd_CircleImageWithUrlString:(NSString *)urlString placeholder:(NSString *)image fillColor:(UIColor *) fillColor {
    NSString *url = [NSString stringWithFormat:@"%@%@",baseImageUrl,urlString];
 [self was_setCircleImageWithUrlString:url placeholder:[UIImage imageNamed:image] fillColor:fillColor opaque:fillColor];
}

- (void)sd_CircleImageWithUrlString:(NSString *)urlString placeholder:(NSString *)image fillColor:(UIColor *) fillColor cornerRadius:(CGFloat) cornerRadius{
    NSString *url = [NSString stringWithFormat:@"%@%@",baseImageUrl,urlString];
   [self was_setRoundRectImageWithUrlString:url placeholder:[UIImage imageNamed:image] fillColor:fillColor opaque:fillColor cornerRadius:cornerRadius];
}
- (void) setImgRadius: (CGFloat) radius {

    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = radius;
//    userhead.layer.borderWidth = 1.0;
//    userhead.layer.borderColor = [[UIColor whiteColor] CGColor];
//
}

- (void) setBoard_width:(CGFloat)board_width {
        self.layer.borderWidth = 1.0;
        self.layer.borderColor = [[UIColor redColor] CGColor];
}

//圆
- (void)was_setCircleImageWithUrlString:(NSString *)urlString placeholder:(UIImage *)image fillColor:(UIColor *)color{
    [self was_setCircleImageWithUrlString:urlString placeholder:image fillColor:color opaque:color];
}

//网络延迟下载--圆形 背景色为透明 无背景色
- (void)was_setCircleImageWithUrlString:(NSString *)urlString placeholder:(UIImage *)image{
    [self was_setCircleImageWithUrlString:urlString placeholder:image fillColor:nil opaque:NO];
}

//圆形矩阵
- (void)was_setRoundRectImageWithUrlString:(NSString *)urlString placeholder:(UIImage *)image fillColor:(UIColor *)color cornerRadius:(CGFloat) cornerRadius{
    [self was_setRoundRectImageWithUrlString:urlString placeholder:image fillColor:color opaque:color cornerRadius:cornerRadius];
}

//网络延迟下载--圆形矩阵 背景色为透明 无背景色
- (void)was_setRoundRectImageWithUrlString:(NSString *)urlString placeholder:(UIImage *)image cornerRadius:(CGFloat) cornerRadius{
    [self was_setRoundRectImageWithUrlString:urlString placeholder:image fillColor:nil opaque:NO cornerRadius:cornerRadius];
}

- (void)was_setCircleImageWithUrlString:(NSString *)urlString placeholder:(UIImage *)image fillColor:(UIColor *)color opaque:(BOOL)opaque{
    [self.superview layoutIfNeeded];
    NSURL *url = [NSURL URLWithString:urlString];
    //防止循环引用
    __weak typeof(self) weakSelf = self;
    CGSize size = self.frame.size;
    
    if (image) {
        //占位图片不为空的情况
        //1.现将占位图圆角化，这样就避免了如图片下载失败，使用占位图的时候占位图不是圆角的问题
        [image was_roundImageWithSize:size fillColor:color opaque:opaque completion:^(UIImage *radiusPlaceHolder) {
            
            //2.使用sd的方法缓存异步下载的图片
            [weakSelf sd_setImageWithURL:url placeholderImage:radiusPlaceHolder completed:^(UIImage *img, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                
                //3.如果下载成功那么讲下载成功的图进行圆角化
                [img was_roundImageWithSize:size fillColor:color opaque:opaque completion:^(UIImage *radiusImage) {
                    weakSelf.image = radiusImage;
                }];
                
            }];
            
        }];
    } else {
        //占位图片为空的情况
        //2.使用sd的方法缓存异步下载的图片
        [weakSelf sd_setImageWithURL:url placeholderImage:nil completed:^(UIImage *img, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            
            //3.如果下载成功那么讲下载成功的图进行圆角化
            [img was_roundImageWithSize:size fillColor:color opaque:opaque completion:^(UIImage *radiusImage) {
                weakSelf.image = radiusImage;
            }];
        }];
    }
}

- (void)was_setRoundRectImageWithUrlString:(NSString *)urlString placeholder:(UIImage *)image fillColor:(UIColor *)color opaque:(BOOL)opaque cornerRadius:(CGFloat) cornerRadius{
    [self.superview layoutIfNeeded];
    NSURL *url = [NSURL URLWithString:urlString];
    //防止循环引用
    __weak typeof(self) weakSelf = self;
    CGSize size = self.frame.size;
    
    if (image) {
        //占位图片不为空的情况
        //1.现将占位图圆角化，这样就避免了如图片下载失败，使用占位图的时候占位图不是圆角的问题
        [image was_roundRectImageWithSize:size fillColor:color opaque:opaque radius:cornerRadius completion:^(UIImage *roundRectPlaceHolder) {
            
            //2.使用sd的方法缓存异步下载的图片
            [weakSelf sd_setImageWithURL:url placeholderImage:roundRectPlaceHolder completed:^(UIImage *img, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                
                //3.如果下载成功那么讲下载成功的图进行圆角化
                [img was_roundRectImageWithSize:size fillColor:color opaque:opaque radius:cornerRadius completion:^(UIImage *radiusImage) {
                    weakSelf.image = radiusImage;
                }];
                
            }];
            
        }];
    } else {
        //占位图片为空的情况
        //.使用sd的方法缓存异步下载的图片
        [weakSelf sd_setImageWithURL:url placeholderImage:nil completed:^(UIImage *img, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            
            //3.如果下载成功那么讲下载成功的图进行圆角化
            [img was_roundRectImageWithSize:size fillColor:color opaque:opaque radius:cornerRadius completion:^(UIImage *radiusImage) {
                weakSelf.image = radiusImage;
            }];
        }];
    }
}
@end
