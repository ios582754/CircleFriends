//
//  HGNetworkingRequest.h
//  HaiGoCustomer
//
//  Created by apple on 17/3/10.
//  Copyright © 2017年 com.zaoguankeji.www. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
typedef void (^RequestCompleteBlock)(id jsonResponse);
typedef void (^RequestErrorBlock)(id jsonResponse);
@interface HGNetworkingRequest : NSObject
//实例化
+ (id)shareRequest;

//get请求
- (void)startGetRequest:(NSString *)requestUrl parameter:(NSDictionary *)parameter showNetworkErrorAlert:(BOOL)showAlert onCompletion:(RequestCompleteBlock)completionBlock onError:(RequestErrorBlock)errorBlock;

//post请求
- (void)startPostRequest:(NSString *)requestUrl parameter:(NSDictionary *)parameter showNetworkErrorAlert:(BOOL)showAlert onCompletion:(RequestCompleteBlock)completionBlock onError:(RequestErrorBlock)errorBlock;

//有图片上传
- (void)startPostUpload:(NSString *)urlstr params:(NSDictionary *)params iconFile:(NSString *)iconName imageFiles:(NSArray *)files onCompletion:(RequestCompleteBlock)completionBlock onError:(RequestErrorBlock)errorBlock;

//没有图片上传
- (void)startPostUpload:(NSString *)urlstr params:(NSDictionary *)params onCompletion:(RequestCompleteBlock)completionBlock onError:(RequestErrorBlock)errorBlock;

@end
