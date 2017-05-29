//
//  UIBarButtonItem+Extension.m
//  大麦
//
//  Created by 洪欣 on 16/12/13.
//  Copyright © 2016年 洪欣. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"
#import "UIButton+Extension.h"
#import "UIView+Extension.h"
@implementation UIBarButtonItem (Extension)


+ (instancetype) itemWithImageName:(NSString *)imageName target:(id)target action:(SEL)action {

    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame=CGRectMake(0, 0, 15, 23);
    [backBtn setBackgroundImage:[UIImage imageNamed:@"navigation_back"] forState:0];
    [backBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
   
   return [[self alloc] initWithCustomView:backBtn];
}

+ (instancetype)itemWithTitle:(NSString *)title target:(id)target action:(SEL)action
{
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:target action:action];
    
    return  item;
}

+ (instancetype)itemWithImageName:(NSString *)imageName highImageName:(NSString *)highImageName target:(id)target action:(SEL)action
{
    UIButton *tagButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [tagButton setBackgroundImage:[[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    [tagButton setBackgroundImage:[[UIImage imageNamed:highImageName]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateHighlighted];
    [tagButton setEnlargeEdgeWithTop:20 right:20 bottom:20 left:20];
    tagButton.size = CGSizeMake(26, 26);
    [tagButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [[self alloc] initWithCustomView:tagButton];
}

+ (instancetype)itemWithImageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName target:(id)target action:(SEL)action
{
    UIButton *tagButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [tagButton setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [tagButton setBackgroundImage:[UIImage imageNamed:selectedImageName] forState:UIControlStateSelected];
    tagButton.size = tagButton.currentBackgroundImage.size;
    [tagButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [[self alloc] initWithCustomView:tagButton];
}

+ (instancetype)itemWithTitle:(NSString *)title ImageName:(NSString *)imageName highImageName:(NSString *)highImageName target:(id)target action:(SEL)action
{
    UIButton *tagButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [tagButton setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [tagButton setImage:[UIImage imageNamed:highImageName] forState:UIControlStateHighlighted];
    [tagButton setTitle:title forState:UIControlStateNormal];
    [tagButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    tagButton.imageEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
    tagButton.titleLabel.font = [UIFont systemFontOfSize:14];
    tagButton.size = tagButton.currentImage.size;
    tagButton.width += 40;
    [tagButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [[self alloc] initWithCustomView:tagButton];
}

- (BOOL)selected
{
    UIButton *button = self.customView;
    
    return button.selected;
}

- (void)setSelected:(BOOL)selected
{
    UIButton *button = self.customView;
    button.selected = selected;
}

@end
