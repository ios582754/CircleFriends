

#import "UIImage+Extension.h"
#import <Accelerate/Accelerate.h>
#import "UIImageView+WebCache.h"
#import "UIButton+WebCache.h"
@implementation UIImage (Extension)
- (UIImage *)imageWithColor:(UIColor *)color
{
    UIGraphicsBeginImageContextWithOptions(self.size, NO, self.scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(context, 0, self.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextSetBlendMode(context, kCGBlendModeNormal);
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    CGContextClipToMask(context, rect, self.CGImage);
    [color setFill];
    CGContextFillRect(context, rect);
    UIImage*newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size
{
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context,color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return img;
}
-(UIImage*)imageWithCornerRadius:(CGFloat)radius{
    
    CGRect rect = (CGRect){0.f,0.f,self.size};
    
    // void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale);
    //size——同UIGraphicsBeginImageContext,参数size为新创建的位图上下文的大小
    //    opaque—透明开关，如果图形完全不用透明，设置为YES以优化位图的存储。
    //    scale—–缩放因子
    UIGraphicsBeginImageContextWithOptions(self.size, NO, [UIScreen mainScreen].scale);
    
    //根据矩形画带圆角的曲线
    CGContextAddPath(UIGraphicsGetCurrentContext(), [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:radius].CGPath);
    
    [self drawInRect:rect];
    
    //图片缩放，是非线程安全的
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    
    //关闭上下文
    UIGraphicsEndImageContext();
    
    return image;
}
- (UIImage *)coreImageBlurNumber:(CGFloat)blur
{
    CIContext *context = [CIContext contextWithOptions:nil];
    CIImage *inputImage= [CIImage imageWithCGImage:self.CGImage];
    //设置filter
    CIFilter *filter = [CIFilter filterWithName:@"CIGaussianBlur"];
    [filter setValue:inputImage forKey:kCIInputImageKey]; [filter setValue:@(blur) forKey: @"inputRadius"];
    //模糊图片
    CIImage *result=[filter valueForKey:kCIOutputImageKey];
    CGImageRef outImage=[context createCGImage:result fromRect:[inputImage extent]];
    UIImage *blurImage=[UIImage imageWithCGImage:outImage];
    CGImageRelease(outImage);
    return blurImage;
}

- (UIImage *)boxblurWithBlurNumber:(CGFloat)blur
{
    if (blur < 0.f || blur > 1.f) {
        blur = 0.5f;
    }
    int boxSize = (int)(blur * 40);
    boxSize = boxSize - (boxSize % 2) + 1;
    CGImageRef img = self.CGImage;
    vImage_Buffer inBuffer, outBuffer;
    vImage_Error error;
    void *pixelBuffer;
    //从CGImage中获取数据
    CGDataProviderRef inProvider = CGImageGetDataProvider(img);
    CFDataRef inBitmapData = CGDataProviderCopyData(inProvider);
    //设置从CGImage获取对象的属性
    inBuffer.width = CGImageGetWidth(img);
    inBuffer.height = CGImageGetHeight(img);
    inBuffer.rowBytes = CGImageGetBytesPerRow(img);
    inBuffer.data = (void*)CFDataGetBytePtr(inBitmapData);
    pixelBuffer = malloc(CGImageGetBytesPerRow(img) * CGImageGetHeight(img));
    if(pixelBuffer == NULL)
        NSLog(@"No pixelbuffer");
    outBuffer.data = pixelBuffer;
    outBuffer.width = CGImageGetWidth(img);
    outBuffer.height = CGImageGetHeight(img);
    outBuffer.rowBytes = CGImageGetBytesPerRow(img);
    error = vImageBoxConvolve_ARGB8888(&inBuffer, &outBuffer, NULL, 0, 0, boxSize, boxSize, NULL, kvImageEdgeExtend);
    if (error) {
        NSLog(@"error from convolution %ld", error);
    }
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef ctx = CGBitmapContextCreate( outBuffer.data, outBuffer.width, outBuffer.height, 8, outBuffer.rowBytes, colorSpace, kCGImageAlphaNoneSkipLast);
    CGImageRef imageRef = CGBitmapContextCreateImage (ctx);
    UIImage *returnImage = [UIImage imageWithCGImage:imageRef];
    //clean up CGContextRelease(ctx);
    CGColorSpaceRelease(colorSpace);
    free(pixelBuffer);
    CFRelease(inBitmapData);
    CGColorSpaceRelease(colorSpace);
    CGImageRelease(imageRef);
    return returnImage;
}
- (void)was_roundImageWithSize:(CGSize)size fillColor:(UIColor *)fillColor opaque:(BOOL)opaque completion:(void (^)(UIImage *))completion {
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        //        NSTimeInterval start = CACurrentMediaTime();
        
        // 1. 利用绘图，建立上下文 BOOL选项为是否为不透明
        UIGraphicsBeginImageContextWithOptions(size, opaque, 0);
        
        CGRect rect = CGRectMake(0, 0, size.width, size.height);
        
        // 2. 设置填充颜色
        if (opaque) {
            [fillColor setFill];
            UIRectFill(rect);
        }
        
        // 3. 利用 贝赛尔路径 `裁切 效果
        UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:rect];
        
        [path addClip];
        
        // 4. 绘制图像 如果图片为空那么为单色渲染
        if (self) {
            [self drawInRect:rect];
        }
        
        // 5. 取得结果
        UIImage *result = UIGraphicsGetImageFromCurrentImageContext();
        
        // 6. 关闭上下文
        UIGraphicsEndImageContext();
        
        //        NSLog(@"%f", CACurrentMediaTime() - start);
        
        // 7. 完成回调
        dispatch_async(dispatch_get_main_queue(), ^{
            if (completion != nil) {
                completion(result);
            }
        });
    });
}

//圆角矩形
- (void)was_roundRectImageWithSize:(CGSize)size fillColor:(UIColor *)fillColor opaque:(BOOL)opaque radius:(CGFloat)radius completion:(void (^)(UIImage *))completion {
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        //        NSTimeInterval start = CACurrentMediaTime();
        
        // 1. 利用绘图，建立上下文 BOOL选项为是否为不透明
        UIGraphicsBeginImageContextWithOptions(size, opaque, 0);
        
        CGRect rect = CGRectMake(0, 0, size.width, size.height);
        
        // 2. 设置填充颜色
        if (opaque) {
            [fillColor setFill];
            UIRectFill(rect);
        }
        
        // 3. 利用 贝赛尔路径 `裁切 效果
        UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:radius];
        //        UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:rect];
        
        [path addClip];
        
        // 4. 绘制图像
        if (self) {
            [self drawInRect:rect];
        }
        
        // 5. 取得结果
        UIImage *result = UIGraphicsGetImageFromCurrentImageContext();
        
        // 6. 关闭上下文
        UIGraphicsEndImageContext();
        
        //        NSLog(@"%f", CACurrentMediaTime() - start);
        
        // 7. 完成回调
        dispatch_async(dispatch_get_main_queue(), ^{
            if (completion != nil) {
                completion(result);
            }
        });
    });
}

@end
