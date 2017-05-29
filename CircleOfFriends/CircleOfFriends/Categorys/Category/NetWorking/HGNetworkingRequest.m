//
//  HGNetworkingRequest.m
//  HaiGoCustomer
//
//  Created by apple on 17/3/10.
//  Copyright © 2017年 com.zaoguankeji.www. All rights reserved.
//

#import "HGNetworkingRequest.h"
#import "GlobalDefines.h"
@implementation HGNetworkingRequest
+ (HGNetworkingRequest *)shareRequest
{
    static HGNetworkingRequest *sharedAccountManagerInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedAccountManagerInstance = [[self alloc] init];
    });
    return sharedAccountManagerInstance;
}

- (void)startGetRequest:(NSString *)requestUrl parameter:(NSDictionary *)parameter showNetworkErrorAlert:(BOOL)showAlert onCompletion:(RequestCompleteBlock)completionBlock onError:(RequestErrorBlock)errorBlock{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer.timeoutInterval = 30;
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/x-json"];
    NSString *requestString = [NSString stringWithFormat:@"%@%@",baseUrl,requestUrl];
    if (parameter!=nil) {
        requestString = [NSString stringWithFormat:@"%@%@%@",baseUrl,requestUrl,[self filterGetParameterValue:parameter]];
    }
    NSLog(@"requestUrl :%@",requestString);
    [manager GET:requestString parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    }
         success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
             
             int responseCode = [[responseObject objectForKey:@"result"] intValue];
             
             if (responseCode == request_success) {
                 completionBlock(responseObject);
             } else {
                 completionBlock(responseObject);
             }
             //
         }
     
         failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull   error) {
             
             NSLog(@"%@",error);  //这里打印错误信息
             errorBlock(error);
         }];
    
}

/**
 PostRequest

 @param requestUrl url
 @param parameter parameter
 @param showAlert 是否想要弹窗
 @param completionBlock 请求成功
 @param errorBlock 失败
 */
- (void)startPostRequest:(NSString *)requestUrl parameter:(NSDictionary *)parameter showNetworkErrorAlert:(BOOL)showAlert  onCompletion:(RequestCompleteBlock)completionBlock onError:(RequestErrorBlock)errorBlock{
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:baseUrl]];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/x-json",nil];
    manager.requestSerializer.timeoutInterval = 30;
    NSLog(@"%@",requestUrl);
    [manager POST:requestUrl parameters:parameter progress:^(NSProgress * _Nonnull downloadProgress) {
        
    }
          success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
              
              NSLog(@"这里打印请求成功要做的事");
              //              completionBlock(responseObject);
              int responseCode = [[responseObject objectForKey:@"result"] intValue];
              
              if (responseCode == request_success) {
                  completionBlock(responseObject);
              } else if (responseCode == error_user_already_Exist) {
                  [MBProgressHUD showError:@"用户名已被注册"];
                  completionBlock(responseObject);
              }else if (responseCode == error_serverfault) {
//                    [MBProgressHUD showError:@"未知错误"];
                  NSString * messaage = responseObject[@"errorMsg"];
                  if ([messaage isEqualToString:error_UserName]) {
                      [MBProgressHUD showError:@"帐号错误"];
                  } else if ([messaage isEqualToString:error_UserPassword]) {
                      [MBProgressHUD showError:@"密码错误"];
                  } else{
                      [MBProgressHUD showError:@"未知错误"];
                  }
                  completionBlock(responseObject);
              } else if (responseCode == error_not_valid){
                      [MBProgressHUD showError:@"短信验证码错误"];
                      completionBlock(responseObject);
              }else  {
                      completionBlock(responseObject);
              }
          }
          failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull   error) {
               [MBProgressHUD showError:@"未知错误"];
              
              errorBlock(error);
          }];
}


//对GET请求参数进行过滤填充

- (NSString *)filterGetParameterValue:(NSDictionary *)parmeter{
    
    if (parmeter!=nil) {
        NSMutableString *getRequestString = [[NSMutableString alloc] init];
        for (NSString *key in [parmeter allKeys]) {
            NSString *value = [NSString stringWithFormat:@"%@",[parmeter objectForKey:key]];
            if ([getRequestString stringIsEmpty]) {
                [getRequestString appendString:[NSString stringWithFormat:@"?%@=%@",key,value]];
            }else{
                [getRequestString appendString:[NSString stringWithFormat:@"&%@=%@",key,value]];
            }
        }
        NSString * encodedString = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes( kCFAllocatorDefault, (CFStringRef)getRequestString, NULL, NULL,  kCFStringEncodingUTF8 ));
        return encodedString;
    }
    return nil;
}

//对Post请求参数进行过滤填充
- (NSDictionary *)filterPostParameterValue:(NSDictionary *)parmeter{
    NSMutableDictionary *dit = [[NSMutableDictionary alloc] init];
    if (parmeter!=nil) {
        NSArray *keys = [parmeter allKeys];
        for (NSString *key in keys) {
            id value = [parmeter objectForKey:key];
            NSString *keyValue = [NSString stringWithFormat:@"%@",value];
            NSString *encodedString = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                                                                            (CFStringRef)keyValue,
                                                                                                            NULL,
                                                                                                            NULL,
                                                                                                            kCFStringEncodingUTF8));
            [dit setValue:encodedString forKey:key];
        }
        return dit;
    }
    return nil;
}

//有图片上传
- (void)startPostUpload:(NSString *)urlstr params:(NSDictionary *)params iconFile:(NSString *)iconName imageFiles:(NSArray *)files onCompletion:(RequestCompleteBlock)completionBlock onError:(RequestErrorBlock)errorBlock{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/x-json",nil];
    manager.requestSerializer.timeoutInterval = 30;
    NSString *upload = [NSString stringWithFormat:@"%@%@",baseUrl,urlstr];
    [manager POST:upload parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        if(nil != iconName){
            [formData appendPartWithFileData:[[NSFileManager defaultManager] contentsAtPath:iconName] name:@"icon" fileName:iconName mimeType: [NSString stringWithFormat:@"image/%@",[iconName pathExtension]]];
        }
        
        if(nil != files){
            for(int i = 0; i < files.count; i++)
            {
                NSString * fileName = [files objectAtIndex:i];
                [formData appendPartWithFileData:[[NSFileManager defaultManager] contentsAtPath:fileName] name:@"photo" fileName:fileName mimeType:[NSString stringWithFormat:@"image/%@",[fileName pathExtension]]];
            }
        }
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
        //打印下上传进度
        PXY_SearchLog(@"%lf",1.0 *uploadProgress.completedUnitCount / uploadProgress.totalUnitCount);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        int responseCode = [[responseObject objectForKey:@"result"] intValue];
        
        if (responseCode == request_success) {
            completionBlock(responseObject);
        }
        //请求成功
//        PXY_SearchLog(@"请求成功：%@",responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        errorBlock(error);
        //请求失败
        PXY_SearchLog(@"请求失败：%@",error);
    }];
    
}

//无图片上传
- (void)startPostUpload:(NSString *)urlstr params:(NSDictionary *)params onCompletion:(RequestCompleteBlock)completionBlock onError:(RequestErrorBlock)errorBlock{
    [self startPostUpload:urlstr params:params iconFile:nil imageFiles:nil onCompletion:completionBlock onError:errorBlock];
}


@end
