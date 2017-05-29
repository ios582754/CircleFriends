//
//  UILabel+Extension.h
//  大麦
//
//  Created by 洪欣 on 16/12/13.
//  Copyright © 2016年 洪欣. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Extension)

- (CGFloat)getTextWidth;
- (CGFloat)getTextHeight;
- (void) setCircle:(UIColor *) color;
- (void) setCircleBgView:(UIColor *) color;
- (void) setCircleradius:(CGFloat) radius;
- (void) setCircleradiusTimeLabel:(CGFloat) radius;
@end
