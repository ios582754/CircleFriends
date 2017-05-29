//
//  MBProgressHUD+KR.h
//  shaBaoZaiXian
//
//  Created by zaoguan_ios_001 on 16/5/27.
//  Copyright © 2016年 xujing. All rights reserved.
//

//#import <MBProgressHUD/MBProgressHUD.h>
#import "MBProgressHUD.h"
typedef void(^HandleBlock)();
typedef void(^CancelBlock)();
@interface MBProgressHUD (KR)

+ (void)showSuccess:(NSString *)success toView:(UIView *)view;
+ (void)showError:(NSString *)error toView:(UIView *)view;

+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view;


+ (void)showSuccess:(NSString *)success;
+ (void)showError:(NSString *)error;

+ (MBProgressHUD *)showMessage:(NSString *)message;

+ (void)hideHUDForView:(UIView *)view;
+ (void)hideHUD;
+ (void)showConfirmWithBlock:(HandleBlock)confirmBlock;
//注销弹窗
+ (void)showExitWithBlock:(HandleBlock)editBlock;

//退出提示框
+ (void)showExitCommunityConfirmWithquit:(CancelBlock)cancelblock  Block:(HandleBlock)confirmBlock;
+ (void)showCommunityMyselfConfirmWithBlock:(HandleBlock)confirmBlock;
@end
