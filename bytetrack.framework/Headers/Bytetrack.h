//
//  BytesTrack.h
//  BytesTrack
//
//  Created by sunliang on 2022/4/7.
//  Copyright © 2022 BytesLink Anhui. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Bytetrack : NSObject

/// 初始化信使SDK
/// @param apiKey 您的apiKey
/// @param appId  您的appId
/// @param url 选填，私有化部署地址，如果不是私有化部署，填nil
+ (void)initMessengerWithApiKey:(NSString *)apiKey forAppId:(NSString *)appId withPrivateServerURL:(NSString *_Nullable)url;

//注册用户业务id
+ (void)registerUserWithUserId:(NSString *)userId;

//注册用户邮箱
+ (void)registerUserWithEmail:(NSString *)email;

//注册用户手机号
+ (void)registerUserWithPhone:(NSString *)phone;

///注册用户自定义属性
///@param userAttributes  属性数组 ,注意：userAttributes里面每个元素都是一个NSDictionary类型，每个NSDictionary包含两个键值对，这两个键值对对应的键分别为"key"和"value",且"key"和"value"对应的值都限定为NSString类型,例如传入的NSArray为：@[@{@"key":@"用户城市",@"value":@"北京市"},@{@"key":@"用户等级",@"value":@"白金会员"}];

+ (void)registerUserAttributes:(nonnull NSArray<NSDictionary*>*)userAttributes;

/// 设置信使语言
/// @param languageType 语言种类  1:zh-Hans  2:en 3:zh-Hant 4:ja ，不设置则默认手机系统语言，若手机系统语言超出信使端支持的语言库，则默认中文。目前版本只支持中文和英文。

+(void)setLanguage:(int)languageType;

//打开信使
+(void)presentMessenger;

//设置启动图标是否一直可见,默认否
+ (void)setLauncherVisible:(BOOL)visible;

//退出登录
+ (void)logout;

//获取SDK版本号
+(NSString*)getSDKVersion;


@end

NS_ASSUME_NONNULL_END
