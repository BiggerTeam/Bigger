////
////  LoginAPI.m
////  Bigger
////
////  Created by Departures on 5/14/16.
////  Copyright © 2016 Huang. All rights reserved.
////
//
//
//#import "LoginAPI.h"
//#import "SOCKit.h"
//#import "AFURLRequestSerialization.h"
//NSString *const LoginAPIBaseURL = @"http://120.24.6.232:15000/Bigger/UserLogin.action?userphone=xxxx&password=xxx";
//// NSString *const LoginAPIStroies
//// NSString *const LoginAPIComments
//NSString *const LoginAPILogin = @"";
//
//
//#pragma mark -
//
//@interface NSURL (LoginAPI)
//
//+ (NSURL *)DNURLWithString:(NSString *)string;
//
//@end
//
//@implementation NSURL (LoginAPI)
//
//+ (NSURL *)BiggerURLWithString:(NSString *)string {
//    return [[self class] URLWithString:[NSString stringWithFormat:@"%@%@", [self baseURL], string]];
//}
//
//+ (NSString *)baseURL {
//    NSString *baseURLConfiguration = [[[NSProcessInfo processInfo] environment] objectForKey:@"baseURL"];
//    
//    return baseURLConfiguration ?: LoginAPIBaseURL;
//}
//
//@end
//
//@implementation NSURLRequest (LoginAPI)
//
//+ (NSURLRequest *)requestWithPattern:(NSString *)string object:(id)object {
//    SOCPattern *pattern = [SOCPattern patternWithString:string];
//    NSString *urlString = [pattern stringFromObject:object];
//    NSURLRequest *request = [self requestWithURL:[NSURL DNURLWithString:urlString]];
//    return request;
//}
//
//+ (NSURLRequest *)postRequest:(NSString *)string parameters:(NSDictionary *)parameters {
//    return [NSURLRequest requestWithMethod:@"POST"
//                                       url:string
//                                parameters:parameters];
//}
//
//+ (NSURLRequest *)deleteRequest:(NSString *)string parameters:(NSDictionary *)parameters {
//    return [NSURLRequest requestWithMethod:@"DELETE"
//                                       url:string
//                                parameters:parameters];
//}
//
//+ (NSURLRequest *)requestWithMethod:(NSString *)method
//                                url:(NSString *)url
//                         parameters:(NSDictionary *)parameters {
//    
//    SOCPattern *pattern = [SOCPattern patternWithString:url];
//    NSString *urlString = [pattern stringFromObject:parameters];
//    
//    NSMutableURLRequest *request = [[AFJSONRequestSerializer serializer]
//                                    requestWithMethod:method
//                                    URLString:[NSString stringWithFormat:@"%@%@", [NSURL baseURL], urlString]
//                                    parameters:parameters];
//    return request;
//}
//
//@end
