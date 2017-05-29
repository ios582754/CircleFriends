//
//  GlobalDefines.h
//  GSD_WeiXin(wechat)
//
//  Created by aier on 16/2/12.
//  Copyright © 2016年 GSD. All rights reserved.
//



#ifndef GlobalDefines_h
#define GlobalDefines_h



//#define stringIsEmpty(str) !(str&&str.length)

#ifdef DEBUG
#define PXY_SearchLog(...) NSLog(__VA_ARGS__)
#else
#define PXY_SearchLog(...)
#endif
#define CMLog(format, ...) NSLog(@"%s:%@", __PRETTY_FUNCTION__,[NSString stringWithFormat:format, ## __VA_ARGS__]);







#define SDColor(r, g, b, a) [UIColor colorWithRed:(r / 255.0) green:(g / 255.0) blue:(b / 255.0) alpha:a]

#define PXY_COLORFROMRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue &0xFF00) >>8))/255.0 blue:((float)(rgbValue &0xFF))/255.0 alpha:1.0]

#define Global_tintColor [UIColor colorWithRed:0 green:(190 / 255.0) blue:(12 / 255.0) alpha:1]

#define Global_TabbarSelectColor [UIColor colorWithRed:(250/255) green:(13 / 255.0) blue:(27 / 255.0) alpha:1]

#define Global_mainBackgroundColor SDColor(248, 248, 248, 1)

#define BTN_Border_COLOR [UIColor redColor]

#define IMg_Radius 5.0f
#define BTN_Radius 5.0f
#define TimeLineCellHighlightedColor [UIColor colorWithRed:92/255.0 green:140/255.0 blue:193/255.0 alpha:1.0]

#define HGAppThemeColor  SDColor(218, 64, 67, 1)
#define BACKVIEW_COLOR  PXY_COLORFROMRGB(0xf6f6f6)

#define PRICECENTERLINE_COLOR  PXY_COLORFROMRGB(0x9E9E9E)
#define PXY_STR(format, ...) [NSString stringWithFormat:format, ## __VA_ARGS__]
#define UpAndDown_COLOR [[UIColor colorWithHexString:@"#f3f3f3"] colorWithAlphaComponent:0.3]
#define LINEVIEW_COLOR  PXY_COLORFROMRGB(0xF08080)
  #define NOData_Text_Color  PXY_COLORFROMRGB(0xcdcdcd)  

#define APPDELEGETE         ((AppDelegate*)[[UIApplication sharedApplication] delegate])
#define PXYNotic [NSNotificationCenter defaultCenter]
#define PXY_Str(num) [NSString stringWithFormat:@"%ld",num]
#define PXY_STR(format, ...) [NSString stringWithFormat:format, ## __VA_ARGS__]
#define SHOW_SIMPLE_TIPS(m) [[[UIAlertView alloc] initWithTitle:@"" message:(m) delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil]show];
#define PXY_IMG(m) [UIImage imageNamed:m]


//---------------------------------Color---------------------------------------
#pragma mark - Color
//红色
#define BASECOLOR_RED [UIColor \
colorWithRed:((float)((0xED5565 & 0xFF0000) >> 16))/255.0 \
green:((float)((0xED5565 & 0xFF00) >> 8))/255.0 \
blue:((float)(0xED5565 & 0xFF))/255.0 alpha:1.0]
#define     RED_NAVBAR_COLOR             SDColor(218, 64, 67, 1);
#define     DEFAULT_NAVBAR_COLOR             WBColor(20.0, 20.0, 20.0, 0.9)
#define     DEFAULT_BACKGROUND_COLOR         WBColor(239.0, 239.0, 244.0, 1.0)
#define     DEFAULT_CHAT_BACKGROUND_COLOR    WBColor(235.0, 235.0, 235.0, 1.0)
#define     DEFAULT_CHATBOX_COLOR            WBColor(244.0, 244.0, 246.0, 1.0)
#define     DEFAULT_SEARCHBAR_COLOR          WBColor(239.0, 239.0, 244.0, 1.0)
#define     DEFAULT_GREEN_COLOR              WBColor(2.0, 187.0, 0.0, 1.0f)
#define     DEFAULT_TEXT_GRAY_COLOR         [UIColor grayColor]
#define     DEFAULT_LINE_GRAY_COLOR          WBColor(188.0, 188.0, 188.0, 0.6f)
#define     DEFAULT_WHITE_COLOR [UIColor clearColor]
#define WBColor(r, g, b, a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:a]
// 主题颜色
#define kMAINCOLOR [[UIColor alloc]initWithRed:250/255.0 green:54/255.0 blue:103/255.0 alpha:1]
// 点击渐变颜色
#define kMaterial_MAINCOLOR [[UIColor alloc]initWithRed:250/255.0 green:54/255.0 blue:103/255.0 alpha:0.5]

// 背景灰
#define kBACKCOLOR [UIColor colorWithRed:241/255.0 green:241/255.0 blue:241/255.0 alpha:1.0]
/**
 *  白色
 */
#define kWhiteColor [UIColor whiteColor]
#define kClearColor [UIColor clearColor]
#define DAY @"day"

#define NIGHT @"night"

#define MAIN_HEADER 40

#define MAIN_PADING 10
#define MAIN_CELL_HIGH 150
#define MAIN_CELL_Friend_HIGH 120
#define OFFSET       0
#define PXYLIMIT  @(10)
#define PXY_FIVE_LIMIT  @(5)
#define PXYZERO 0
#endif
