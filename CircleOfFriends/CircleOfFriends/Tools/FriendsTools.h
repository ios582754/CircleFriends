//
//  FriendsTools.h
//  CircleOfFriends
//
//  Created by apple on 17/5/29.
//  Copyright © 2017年 pxymac. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^removetopicCollectionBlock)(BOOL isScuess);
typedef void(^addtopicCollectionBlock)(BOOL isScuess);
typedef void(^IsLoginActionBlock)(BOOL isScuess);
typedef void (^AddCiommunityScuessBlock)(id jsonResponse);
typedef void (^AddCiommunityErrorBlock)(id jsonResponse);
typedef void (^AddSayYesScuessBlock)(id jsonResponse ,NSInteger currentNum);
@interface FriendsTools : NSObject
+ (FriendsTools *)sharedManager;
//朋友圈点赞
- (void) addRequestupdatePraiseData:(NSString *)contentId ScuesssucessBlock :(AddCiommunityScuessBlock) scuessBlock  errorBlock :(AddCiommunityErrorBlock) errorBlock;
//朋友圈评论
- (void) addSnsComment:(NSString *)contentId comment:(NSString *)comment ScuesssucessBlock :(AddCiommunityScuessBlock) scuessBlock  errorBlock :(AddCiommunityErrorBlock) errorBlock;
@end
