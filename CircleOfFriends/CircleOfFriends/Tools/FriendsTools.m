//
//  FriendsTools.m
//  CircleOfFriends
//
//  Created by apple on 17/5/29.
//  Copyright © 2017年 pxymac. All rights reserved.
//

#import "FriendsTools.h"

@implementation FriendsTools
+ (FriendsTools *)sharedManager
{
    static FriendsTools *sharedAccountManagerInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedAccountManagerInstance = [[self alloc] init];
    });
    return sharedAccountManagerInstance;
}
//朋友圈点赞
- (void) addRequestupdatePraiseData:(NSString *)contentId ScuesssucessBlock :(AddCiommunityScuessBlock) scuessBlock  errorBlock :(AddCiommunityErrorBlock) errorBlock{
    
    NSMutableDictionary *requestParameter = [NSMutableDictionary dictionary];
    //snsContentId=100001
    requestParameter[@"snsContentId"] = contentId;
    //    requestParameter[@"curDate"] = [NSString getToday];
    //    requestParameter[@"PASSWORD"] = passwordStr ;
    [[HGNetworkingRequest shareRequest] startPostRequest:api_updatePraise parameter:requestParameter showNetworkErrorAlert:YES onCompletion:^(id jsonResponse) {
        PXY_SearchLog(@"%@",[NSString stringTOjson: jsonResponse]);
        int result = [[jsonResponse objectForKey:@"result"] intValue];
        if (result == 1) {
            
            dispatch_async(dispatch_get_main_queue(), ^{
                scuessBlock(jsonResponse);
            });
        } else {
            errorBlock(jsonResponse);
            [MBProgressHUD showError:@"点赞失败"];
        }
    } onError:^(id jsonResponse) {
        errorBlock(jsonResponse);
        [MBProgressHUD showError:@"点赞失败"];
    }];
    
    
}
//朋友圈评论
- (void)addSnsComment:(NSString *)contentId comment:(NSString *)comment ScuesssucessBlock :(AddCiommunityScuessBlock) scuessBlock  errorBlock :(AddCiommunityErrorBlock) errorBlock{
    
    NSMutableDictionary *requestParameter = [NSMutableDictionary dictionary];
    //snsContentId=100001
    requestParameter[@"content"] = comment;
    requestParameter[@"snsContentId"] = contentId;
    //    requestParameter[@"curDate"] = [NSString getToday];
    //    requestParameter[@"PASSWORD"] = passwordStr ;
    [[HGNetworkingRequest shareRequest] startPostRequest:api_addSnsComment parameter:requestParameter showNetworkErrorAlert:YES onCompletion:^(id jsonResponse) {
        PXY_SearchLog(@"%@",[NSString stringTOjson: jsonResponse]);
        int result = [[jsonResponse objectForKey:@"result"] intValue];
        if (result == 1) {
            
            dispatch_async(dispatch_get_main_queue(), ^{
                scuessBlock(jsonResponse);
            });
        } else {
            errorBlock(jsonResponse);
            [MBProgressHUD showError:@"点赞失败"];
        }
    } onError:^(id jsonResponse) {
        errorBlock(jsonResponse);
        [MBProgressHUD showError:@"点赞失败"];
    }];
    
    
}
@end
