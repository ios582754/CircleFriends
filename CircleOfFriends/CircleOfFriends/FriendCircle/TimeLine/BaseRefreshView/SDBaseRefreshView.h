//
//  SDBaseRefreshView.h
//  GSD_WeiXin(wechat)
//
//  Created by gsd on 16/3/5.
//  Copyright © 2016年 GSD. All rights reserved.
//



#import <UIKit/UIKit.h>

UIKIT_EXTERN NSString *const kSDBaseRefreshViewObserveKeyPath;

typedef enum {
    SDWXRefreshViewStateNormal,
    SDWXRefreshViewStateWillRefresh,
    SDWXRefreshViewStateRefreshing,
} SDWXRefreshViewState;

@interface SDBaseRefreshView : UIView

@property (nonatomic, strong) UIScrollView *scrollView;

- (void)endRefreshing;

@property (nonatomic, assign) UIEdgeInsets scrollViewOriginalInsets;
@property (nonatomic, assign) SDWXRefreshViewState refreshState;

@end
