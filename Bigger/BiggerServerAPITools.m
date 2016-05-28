//
//  BiggerServerAPITools.m
//  Bigger
//
//  Created by Huang on 16/5/13.
//  Copyright © 2016年 Huang. All rights reserved.
//

#import "BiggerServerAPITools.h"



@implementation BiggerServerAPITools


/**
 *   注册手机
 */
+(NSString *)RegisterUserphone:(NSString *)aUserphone Password:(NSString *)aPassword Username:(NSString *)aUsername{
    
    NSString *basepath=HOST;
    NSMutableString *urlpath = [[NSMutableString alloc] initWithString:basepath];
    [urlpath appendString:@"/Bigger/UserRegister.action?userphone="];
    [urlpath appendString:aUserphone];
    [urlpath appendString:@"&password="];
    [urlpath appendString:aPassword];
    [urlpath appendString:@"&username="];
    [urlpath appendString:aUsername];
    
    return urlpath;
}

/**
 *    登录
 */
+(NSString *)LoginUserphone:(NSString *)aUserphone Password:(NSString *)aPassword{
    NSString *basepath=HOST;
    NSMutableString *urlpath = [[NSMutableString alloc] initWithString:basepath];
    [urlpath appendString:@"/Bigger/UserLogin.action?userphone="];
    [urlpath appendString:aUserphone];
    [urlpath appendString:@"&password="];
    [urlpath appendString:aPassword];
    
    return urlpath;
}

/**
 *   添加标签
 */
+(NSString *)AddLabelUserphone:(NSString *)aUserphone Userlabel:(NSMutableString *)aUserlabel{
    NSString *basepath = HOST;
    NSMutableString *urlpath = [[NSMutableString alloc] initWithString:basepath];
    [urlpath appendString:@"/Bigger/AddLable.action?userphone="];
    [urlpath appendString:aUserphone];
    [urlpath appendString:@"&userlable="];
    [urlpath appendString:aUserlabel];
    
    return  urlpath;
}
@end
