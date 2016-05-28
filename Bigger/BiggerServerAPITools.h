//
//  BiggerServerAPITools.h
//  Bigger
//
//  Created by Huang on 16/5/13.
//  Copyright © 2016年 Huang. All rights reserved.
//

#import <Foundation/Foundation.h>

//定义服务器地址
#define  HOST @"http://120.24.6.232:15000"
//注册返回值
#define REGISTERSUCCESS 200
#define REGISTERFAIL 500
#define PHONEALREADYEXIST 100
//登录返回值
#define LOGINSUCCESS 200
#define WRONGPASSWORD 500
#define ILLEGALACCOUNT 100
//标签返回值
#define ACCONUTNOTEXIST 100
#define ADDSUCCESS 200


@interface BiggerServerAPITools : NSObject


+(NSString *)RegisterUserphone:(NSString *)aUserphone Password:(NSString *)aPassword Username:(NSString *)aUsername;

+(NSString *)LoginUserphone:(NSString *)aUserphone Password:(NSString *)aPassword;

+(NSString *)AddLabelUserphone:(NSString *)aUserphone Userlabel:(NSMutableString *)aUserabel;

@end
