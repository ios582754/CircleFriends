

#import <UIKit/UIKit.h>

@interface UIImageView (Extension)
- (void)CircleImageVIew ;
- (void) setImgRadius: (CGFloat) radius;
- (void) sd_setImage:(NSString *)img pleasehold:(NSString *) pleasehold;
@property (nonatomic, assign) CGFloat Board_width; ///


- (void)sd_CircleImageWithUrlString:(NSString *)urlString placeholder:(NSString *)image fillColor:(UIColor *) fillColor;
- (void)sd_CircleImageWithUrlString:(NSString *)urlString placeholder:(NSString *)image fillColor:(UIColor *) fillColor cornerRadius:(CGFloat) cornerRadius;
//网络延迟下载--圆形 有背景色
- (void)was_setCircleImageWithUrlString:(NSString *)urlString placeholder:(UIImage *)image fillColor:(UIColor *)color;
//网络延迟下载--圆形矩阵 有背景色
- (void)was_setRoundRectImageWithUrlString:(NSString *)urlString placeholder:(UIImage *)image fillColor:(UIColor *)color cornerRadius:(CGFloat) cornerRadius;

//网络延迟下载--圆形    背景色为透明 无背景色
- (void)was_setCircleImageWithUrlString:(NSString *)urlString placeholder:(UIImage *)image;
//网络延迟下载--圆形矩阵 背景色为透明 无背景色
- (void)was_setRoundRectImageWithUrlString:(NSString *)urlString placeholder:(UIImage *)image cornerRadius:(CGFloat) cornerRadius;

@end
