//
//  PXYCalculateLayout.m
//  PXY_layout
//
//  Created by apple on 17/3/18.
//  Copyright © 2017年 com.zaoguankeji.www. All rights reserved.
//

#import "PXYCalculateLayout.h"
#define IS_IPAD     [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad
#define IS_IPHONE   [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone
#define iPhone4 (fabs((double)[[UIScreen mainScreen] bounds].size.height - (double )480) < DBL_EPSILON )
#define iPhone5 (fabs((double)[[UIScreen mainScreen] bounds].size.height - (double )568) < DBL_EPSILON )
#define iPhone6 (fabs((double)[[UIScreen mainScreen] bounds].size.height - (double )667) < DBL_EPSILON )
#define iPhone6P (fabs((double)[[UIScreen mainScreen] bounds].size.height - (double )736) < DBL_EPSILON )
#define iPhone7 (fabs((double)[[UIScreen mainScreen] bounds].size.height - (double )667) < DBL_EPSILON )
#define iPhone7P (fabs((double)[[UIScreen mainScreen] bounds].size.height - (double )736) < DBL_EPSILON )
#define iPhone4Height (480.f)
#define iPhone4Width  (320.f)

#define iPhone5Height (568.f)
#define iPhone5Width  (320.f)

#define iPhone6Height (667.f)
#define iPhone6Width  (375.f)

#define iPhone6PlusHeight (736.f)
#define iPhone6PlusWidth  (414.f)
#pragma mark - Height

@implementation PXYCalculateLayout

+ (CGFloat)pxy_neu_iPhone4Height:(CGFloat)height {
    return [self layoutForAlliPhoneHeight:height type:iPhone4Type];
}

+ (CGFloat)pxy_neu_iPhone5Height:(CGFloat)height {
    return [self layoutForAlliPhoneHeight:height type:iPhone5Type];
}

+ (CGFloat)pxy_neu_iPhone6Height:(CGFloat)height {
    return [self layoutForAlliPhoneHeight:height type:iPhone6Type];
}

+ (CGFloat)pxy_neu_iPhone6PlusHeight:(CGFloat)height {
    return [self layoutForAlliPhoneHeight:height type:iPhone6PlusType];
}

#pragma mark - Width

+(CGFloat)pxy_neu_iPhone4Width:(CGFloat)width {
    return [self layoutForAlliPhoneWidth:width type:iPhone4Type];
}

+ (CGFloat)pxy_neu_iPhone5Width:(CGFloat)width {
    return [self layoutForAlliPhoneWidth:width type:iPhone5Type];
}

+ (CGFloat)pxy_neu_iPhone6Width:(CGFloat)width {
    return [self layoutForAlliPhoneWidth:width type:iPhone6Type];
}

+ (CGFloat)pxy_neu_iPhone6PlusWidth:(CGFloat)width {
    return [self layoutForAlliPhoneWidth:width type:iPhone6PlusType];
}

#pragma mark - Global Method
+ (CGFloat)layoutForAlliPhoneHeight:(CGFloat)height type:(IPhoneType)type {
    CGFloat layoutHeight = 0.0f;
    switch (type) {
        case iPhone4Type:
            layoutHeight = ( height / iPhone6Height ) * iPhone4Height;
            break;
        case iPhone5Type:
            layoutHeight = ( height / iPhone6Height ) * iPhone5Height;
            break;
        case iPhone6Type:
            layoutHeight = ( height / iPhone6Height ) * iPhone6Height;
            break;
        case iPhone6PlusType:
            layoutHeight = ( height / iPhone6Height ) * iPhone6PlusHeight;
            break;
        default:
            break;
    }
    return layoutHeight;
}

+ (CGFloat)layoutForAlliPhoneWidth:(CGFloat)width type:(IPhoneType)type {
    CGFloat layoutWidth = 0.0f;
    switch (type) {
        case iPhone4Type:
            layoutWidth = ( width / iPhone6Width ) * iPhone4Width;
            break;
        case iPhone5Type:
            layoutWidth = ( width / iPhone6Width ) * iPhone5Width;
            break;
        case iPhone6Type:
            layoutWidth = ( width / iPhone6Width ) * iPhone6Width;
            break;
        case iPhone6PlusType:
            layoutWidth = ( width / iPhone6Width ) * iPhone6PlusWidth;
            break;
        default:
            break;
    }
    return layoutWidth;
}

#pragma mark - 适配所有机型高度
+ (CGFloat)pxy_neu_layoutForAlliPhoneHeight:(CGFloat)height {
    CGFloat layoutHeight = 0.0f;
    if (iPhone4) {
        layoutHeight = ( height / iPhone6Height ) * iPhone4Height;
    } else if (iPhone5) {
        layoutHeight = ( height / iPhone6Height ) * iPhone5Height;
    } else if (iPhone6) {
        layoutHeight = ( height / iPhone6Height ) * iPhone6Height;
    } else if (iPhone6P ) {
        layoutHeight = ( height / iPhone6Height ) * iPhone6PlusHeight;
    } else {
        layoutHeight = height;
    }
    return layoutHeight;
}

+ (CGFloat)pxy_neu_layoutForAlliPhoneWidth:(CGFloat)width {
    CGFloat layoutWidth = 0.0f;
    if (iPhone4) {
        layoutWidth = ( width / iPhone6Width ) * iPhone4Width;
    } else if (iPhone5) {
        layoutWidth = ( width / iPhone6Width ) * iPhone5Width;
    } else if (iPhone6) {
        layoutWidth = ( width / iPhone6Width ) * iPhone6Width;
    } else if (iPhone6P) {
        layoutWidth = ( width / iPhone6Width ) * iPhone6PlusWidth;
    }
    return layoutWidth;
}

#pragma mark - 计算1个像素的高度

+ (CGFloat)pxy_neu_onePixel {
    UIScreen* mainScreen = [UIScreen mainScreen];
    CGFloat onePixel = 1.0 / mainScreen.scale;
    if ([mainScreen respondsToSelector:@selector(nativeScale)]) {
        onePixel = 1.0 / mainScreen.nativeScale;
    }
    if (iPhone6P) {
        onePixel = 0.7;
    }
    return onePixel;
}

@end
