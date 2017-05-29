//
//  AppApiConstants.h
//  AppsTemplate
//  配置项目接口连接的位置
//  Created by Leon on 8/1/14.
//  Copyright (c) 2014 Leon. All rights reserved.
//

#ifndef AppsTemplate_AppApiConstants_h
#define AppsTemplate_AppApiConstants_h


//192.168.0.67:8080    本地调试环境
//192.168.0.105:8080   开发环境
//120.76.43.36:7001    测试环境
//120.76.159.129:7001  生产环境
//15800434162
//#pragma mark ----------------------------------------- 本地调试环境
#define baseUrl @"http://www.zaoguankeji.com:8082/higo/control/"
#define baseImageUrl @"http://www.zaoguankeji.com:8082/higo/images/"
////#pragma mark ----------------------------------------- 开发环境
//#define baseUrl @"http://192.168.5.12:8080/higo/control/"
//#define baseImageUrl @"http://192.168.5.12:8080/higo/images/"

////#pragma mark ----------------------------------------- 测试环境
//#define baseUrl @"http://120.76.43.36:7001/ShaBaoWeb/app/v2/"
//#define baseImageUrl @"http://120.76.43.36:7001/ShaBaoWeb/images/"

//#pragma mark ----------------------------------------- 生产环境
//#define baseUrl @"http://120.76.159.129:7001/ShaBaoWeb/app/v2/"
//#define baseImageUrl @"http://120.76.159.129:7001/ShaBaoWeb/images/"

/**
 *  数据接口
 */
//---------------------------------------朋友圈相关---------------

 
//得到朋友圈列表
#define api_getSnsContent @"getSnsContent"

//发布朋友圈
#define api_addSnsContent @"addSnsContent"

//添加朋友圈的评论
#define api_addSnsComment @"addSnsComment"

//点赞朋友圈
#define api_updatePraise @"updatePraise"
//------------------------------------ 通知----------------------

#define K_NSUSERDEF [NSUserDefaults standardUserDefaults]
#define kChangeWift @"wiftChange"
#define kLoginSuccess @"LoginSuccess"
#define kChartNumNotifi @"ChartNumNotifi"
#define kGOODSCollection_CHANGE @"GOODSCollectionChange"
#define kChange_Community_Scuess @"Change_Community_Scuess"
#define kPopViewControllerNotification @"kPopViewControllerNotification"
#define K_AddServices_Item  @"kAddServicesItem"




/**
 *  服务器返回结果code
 *
 */


#define error_UserName @"following error occurred during login: User not found."
#define error_UserPassword @"following error occurred during login: Password incorrect."
#define request_success  1            //成功
#define error_fail -1                 //参数错误
#define error_serverfault -2         //服务器错误
#define error_sent -3                 //已经发送过
#define error_lose -4                 //验证码过期
#define error_phoneNoExist -5         //手机号已被注册
#define error_pwd -6                  //登陆名或密码有误
#define error_user_already_Exist -7          //用户不存在
#define error_companyName -8          //公司名不合理
#define error_customExist -10              //客户已存在
#define error_validata -12            //验证码错误
#define error_passwordd -4   //登陆名或密码有误
#define error_phoneNotExist -5   //登陆名或密码有误
#define error_resetPassword -3   //需要更新密码
#define error_not_valid  -9 
/*
 Message Types
 */


#define EVENT_ENTER_COMMUNITY @"ReqEnterCommunity"//人加入社区
#define EVENT_JOIN_COMMUNITY  @"ReqJoinCommunity"//店铺加入社区

#define EVENT_ADD_FRIEND @"ReqAddFriend"
#define EVENT_ADD_FRIEND_ACK @"ReqAddFriendAck"
#define EVENT_ADD_FRIEND_ACK @"ReqAddFriendAck"
//#define EVENT_ADD_FRIEND_ACK @"ReqStoreEnterCommunity"

#define EVENT_ALL @"all"
#define RecommentCommunitys @"RecommentCommunitys"

#define EVENT_ACK_ACCEPT @"accept"
#define EVENT_ACK_REJECT @"reject"
#define EVENT_ACK_IGNORE @"ignore"
/*
//ORDER_HEADER_STATUS
public static final String ORDER_CREATED = "ORDER_CREATED";
public static final String ORDER_CANCELLED = "ORDER_CANCELLED";
public static final String ORDER_PAYED = "ORDER_PAYED";
public static final String ORDER_SENT = "ORDER_SENT";
public static final String ORDER_ACCEPT = "ORDER_ACCEPT";
public static final String ORDER_CLOSE = "ORDER_CLOSE";

//ORDER_ITEM STATUS
public static final String ORDER_ITEM_CREATED = "ITEM_CREATED";
public static final String ORDER_ITEM_CANCELLED = "ITEM_CANCELLED";
public static final String ORDER_ITEM_PAYED = "ITEM_PAYED";
public static final String ORDER_ITEM_SENT = "ITEM_SENT";
public static final String ORDER_ITEM_ACCEPT = "ITEM_ACCEPT";
public static final String ORDER_ITEM_CLOSE = "ITEM_CLOSE";
*/

#define order_created  @"ORDER_CREATED"  //订单创建
#define order_canceled  @"ORDER_CANCELLED"            //订单取消
#define order_payed  @"ORDER_PAYED"            //已付款
#define order_sent  @"ORDER_SENT"  //订单发货
#define order_accept  @"ORDER_ACCEPT"            //待评价
#define order_close  @"ORDER_CLOSE"            //订单关闭

//店铺的items
#define order_item_created  @"ITEM_CREATED"  //订单创建
#define order_item_canceled  @"ITEM_CANCELLED"            //订单取消
#define order_item_payed  @"ITEM_PAYED"            //已付款
#define order_item_sent  @"ITEM_SENT"  //订单发货
#define order_item_accept  @"ITEM_ACCEPT"            //订单
#define order_item_close  @"ITEM_CLOSE"            //订单关闭

#endif
