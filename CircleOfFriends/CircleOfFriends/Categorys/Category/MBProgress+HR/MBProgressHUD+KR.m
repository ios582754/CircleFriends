//
//  MBProgressHUD+KR.m
//  shaBaoZaiXian
//
//  Created by zaoguan_ios_001 on 16/5/27.
//  Copyright © 2016年 xujing. All rights reserved.
//

#import "MBProgressHUD+KR.h"

@implementation MBProgressHUD (KR)

#pragma mark 显示信息
+ (void)show:(NSString *)text icon:(NSString *)icon view:(UIView *)view
{
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.labelText = text;
    // 设置图片
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"MBProgressHUD.bundle/%@", icon]]];
    // 再设置模式
    hud.mode = MBProgressHUDModeCustomView;
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    
    // 1秒之后再消失
    [hud hide:YES afterDelay:1.0];
}

#pragma mark 显示错误信息
+ (void)showError:(NSString *)error toView:(UIView *)view{
    [self show:error icon:@"error.png" view:view];
}

+ (void)showSuccess:(NSString *)success toView:(UIView *)view
{
    [self show:success icon:@"success.png" view:view];
}

#pragma mark 显示一些信息
+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view {
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.labelText = message;
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    // YES代表需要蒙版效果
    hud.dimBackground = YES;
    return hud;
}

+ (void)showSuccess:(NSString *)success
{
    [self showSuccess:success toView:nil];
}

+ (void)showError:(NSString *)error
{
    [self showError:error toView:nil];
}

+ (MBProgressHUD *)showMessage:(NSString *)message
{
    return [self showMessage:message toView:nil];
}

+ (void)hideHUDForView:(UIView *)view
{
    [self hideHUDForView:view animated:YES];
}

+ (void)hideHUD
{
    [self hideHUDForView:nil];
}
//提示自己的社区
+ (void)showCommunityMyselfConfirmWithBlock:(HandleBlock)confirmBlock {
    [self showAlterViewWithType:UIAlertControllerStyleAlert Title:@"你不能退出,自己创建的社区, 谢谢!!" andMessage:nil andFirstName:nil style:UIAlertActionStyleDefault andHandleBlock:nil andSecondName:@"确认" style:UIAlertActionStyleCancel andHandleBlock:confirmBlock];
}

+ (void)showAlterViewWithType:(UIAlertControllerStyle)alterType Title:(NSString*)title andMessage:(NSString*)message andFirstName:(NSString*)firstName style:(UIAlertActionStyle)firstStyle andHandleBlock:(HandleBlock)firstBlock andSecondName:(NSString*)secondName style:(UIAlertActionStyle)secondStyle andHandleBlock:(HandleBlock)secondBlock {
    UIAlertController* alter = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:alterType];
    UIAlertAction* action1 = [UIAlertAction actionWithTitle:secondName style:firstStyle handler:^(UIAlertAction * _Nonnull action) {
        //填写处理逻辑
        if (firstBlock) {
            firstBlock();
        }
    }];
   
    [alter addAction:action1];
    UIViewController* VC = [UIApplication sharedApplication].keyWindow.rootViewController;
    //弹出选择框
    [VC presentViewController:alter animated:YES completion:nil];
}


//确认弹窗
+ (void)showConfirmWithBlock:(HandleBlock)confirmBlock
{
    [self showSystemAlterViewWithType:UIAlertControllerStyleAlert Title:@"你网络断了,请检查网络" andMessage:nil andFirstName:@"取消" style:UIAlertActionStyleDefault andHandleBlock:nil andSecondName:@"确认" style:UIAlertActionStyleCancel andHandleBlock:confirmBlock];
}

//退出提示框
+ (void)showExitCommunityConfirmWithquit:(CancelBlock)cancelblock  Block:(HandleBlock)confirmBlock
{
    [self showSystemAlterViewWithType:UIAlertControllerStyleAlert Title:@"退出社区提醒" andMessage:@"你确定退出该社区" andFirstName:@"取消" style:UIAlertActionStyleDefault andHandleBlock:cancelblock andSecondName:@"确认" style:UIAlertActionStyleCancel andHandleBlock:confirmBlock];
}

//注销弹窗
+ (void)showExitWithBlock:(HandleBlock)editBlock;
{
    [self showSystemAlterViewWithType:UIAlertControllerStyleActionSheet Title:@"退出登录" andMessage:@"请确认" andFirstName:@"取消" style:UIAlertActionStyleCancel andHandleBlock:nil andSecondName:@"确认" style:UIAlertActionStyleDestructive andHandleBlock:editBlock];
}

+ (void)showSystemAlterViewWithType:(UIAlertControllerStyle)alterType Title:(NSString*)title andMessage:(NSString*)message andFirstName:(NSString*)firstName style:(UIAlertActionStyle)firstStyle andHandleBlock:(HandleBlock)firstBlock andSecondName:(NSString*)secondName style:(UIAlertActionStyle)secondStyle andHandleBlock:(HandleBlock)secondBlock {
    UIAlertController* alter = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:alterType];
    UIAlertAction* action1 = [UIAlertAction actionWithTitle:firstName style:firstStyle handler:^(UIAlertAction * _Nonnull action) {
        //填写处理逻辑
        if (firstBlock) {
            firstBlock();
        }
    }];
    UIAlertAction* action2 = [UIAlertAction actionWithTitle:secondName style:secondStyle handler:^(UIAlertAction * _Nonnull action) {
        //填写处理逻辑
        if (secondBlock) {
            secondBlock();
        }
    }];
    [alter addAction:action1];
    [alter addAction:action2];
    UIViewController* VC = [UIApplication sharedApplication].keyWindow.rootViewController;
    //弹出选择框
    [VC presentViewController:alter animated:YES completion:nil];
}


@end
