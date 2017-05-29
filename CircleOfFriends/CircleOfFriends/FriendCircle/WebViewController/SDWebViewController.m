//
//  SDWebViewController.m
//  GSD_WeiXin(wechat)
//
//  Created by gsd on 16/2/16.
//  Copyright © 2016年 GSD. All rights reserved.
//



#import "SDWebViewController.h"
//#import "ZYShareView.h"
#import "UUInputAccessoryView.h"
@interface SDWebViewController () <UIWebViewDelegate>

@property (nonatomic, strong) UIWebView *webView;

@end

@implementation SDWebViewController

+ (instancetype)webViewControllerWithUrlString:(SDTimeLineCellModel *)urlString
{
    SDWebViewController *vc = [SDWebViewController new];
    vc.urlString = urlString;
    return vc;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.webView = [UIWebView new];
    self.webView.frame = self.view.bounds;
    self.webView.delegate = self;
    [self.view addSubview:self.webView];
#warning 需要改掉..........
//    if (![self.urlString.url hasPrefix:@"http"]) {
//        NSString *url  = PXY_STR(@"https://%@",self.urlString.url);
//        self.urlString.url = url;
//    } else {
//    }
//    
//    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.urlString.url]]];
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame=CGRectMake(0, 0, 15, 23);
    [backBtn setBackgroundImage:[UIImage imageNamed:@"shareIcon"] forState:0];
    [backBtn addTarget:self action:@selector(shareBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem =  [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    self.navigationItem.rightBarButtonItem = leftItem;
    UIBarButtonItem *leftItemback = [UIBarButtonItem itemWithImageName:nil target:self action:@selector(backView)];
    self.navigationItem.leftBarButtonItem = leftItemback;
}

- (void)backView {
    [UUInputAccessoryView dimiss];
    //    [UUInputAccessoryView sharedView] = nil;
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)shareBtnAction:(UIButton *)sender {
    [self shareToSomeOne];
}

- (void)shareToSomeOne {
    WeakSelf;
    [UUInputAccessoryView showKeyboardConfige:^(UUInputConfiger * _Nonnull configer) {
        configer.backgroundUserInterface = NO;
    } content: @"分享" block:^(NSString * _Nonnull contentStr) {
        if (contentStr.length > 0) {
            [weakSelf requesaddCommunitytDataFromNetWorking:contentStr];
        }
    }];
}

- (void) requesaddCommunitytDataFromNetWorking:(NSString *) string {
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    //转发
    NSMutableDictionary *requestParameter = [NSMutableDictionary dictionary];
    requestParameter[@"content"] = [string trimming];
//    requestParameter[@"url"] = self.urlString.url;
//    requestParameter[@"urlIcon"] = self.urlString.urlIcon;
//    requestParameter[@"urlTitle"] = self.urlString.urlTitle;
    //    requestParameter[@"description"] = self.communityDes;
    [[HGNetworkingRequest shareRequest] startPostUpload:api_addSnsContent params:requestParameter iconFile:nil imageFiles:nil  onCompletion:^(id jsonResponse) {
        PXY_SearchLog(@"===%@",  [NSString stringTOjson: jsonResponse] );
        int result = [[jsonResponse objectForKey:@"result"] intValue];
        if (result == 1) {
            dispatch_async(dispatch_get_main_queue(), ^{
                //回调或者说是通知主线程刷新，
                [self analyzingaddCommunityData:jsonResponse];
            });
        }
    } onError:^(id jsonResponse) {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        [MBProgressHUD showError:@"网络未连接"];
    }];
}

- (void)analyzingaddCommunityData:(id)data {
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    //    [PXYNotic postNotificationName:kChange_Community_Scuess object:nil];
    //    [self popToListViewCommunityManager];
}

#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    return YES;
}

- (void)itemAction:(NSString *)title {
    NSLog(@"%@", title);
}
#pragma mark - UIWebViewDelegate

- (void)webViewDidStartLoad:(UIWebView *)webView {
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    
}

@end
