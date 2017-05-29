//
//  HGSnsContentModel.h
//  HaiGoCustomer
//
//  Created by apple on 17/5/25.
//  Copyright © 2017年 com.zaoguankeji.www. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface PraiseUsers :NSObject
@property (nonatomic , copy) NSString              * userLoginId;
@property (nonatomic , copy) NSString              * userName;

@end

@interface Comment :NSObject
@property (nonatomic , copy) NSString              * content;
@property (nonatomic , copy) NSString              * userLoginId;
@property (nonatomic , copy) NSString              * userName;

@end

@interface SnsContents :NSObject
@property (nonatomic , copy) NSString              * ats;
@property (nonatomic , strong) NSArray<PraiseUsers *>              * praiseUsers;
@property (nonatomic , copy) NSString              * lastUpdatedStamp;
@property (nonatomic , copy) NSString              * createdTxStamp;
@property (nonatomic , assign) NSInteger              commentNum;
@property (nonatomic , copy) NSString              * snsContentId;
@property (nonatomic , copy) NSString              * content;
@property (nonatomic , copy) NSString              * urlIcon;
@property (nonatomic , copy) NSString              * url;
@property (nonatomic , copy) NSString              * urlTitle;
@property (nonatomic , copy) NSString              * userIcon;
@property (nonatomic , copy) NSString              * title;
@property (nonatomic , copy) NSString              * userName;
@property (nonatomic , strong) NSArray<Comment *>              * comment;
@property (nonatomic , copy) NSString              * imagePaths;
@property (nonatomic , copy) NSString              * lastUpdatedTxStamp;
@property (nonatomic , copy) NSString              * createdStamp;
@property (nonatomic , copy) NSString              * userLoginId;
@property (nonatomic , assign) NSInteger              prizeNum;

@end

@interface HGSnsContentModel :NSObject
@property (nonatomic , copy) NSString              * result;
@property (nonatomic , strong) NSArray<SnsContents *>              * snsContents;

@end
