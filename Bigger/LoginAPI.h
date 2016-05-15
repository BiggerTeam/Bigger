//
//  LoginAPI.h
//  Bigger
//
//  Created by Departures on 5/14/16.
//  Copyright © 2016 Huang. All rights reserved.
//

#import <Foundation/Foundation.h>

//Referencing variables
extern NSString *const LoginAPIBaseURL;
extern NSString *const LoginAPIStroies;
extern NSString *const LoginAPIComments;
extern NSString *const LoginAPILogin;

@interface NSURLRequest(LoginAPI)

//functions we will need
+(instancetype) requestWithPattern:(NSString *)string object:(id)object;
+(instancetype) postRequest:(NSString *) string parameters:(NSDictionary *)paraments;
+(instancetype)deleteRequest:(NSString *)string parameters:(NSDictionary *)paraments;
+(instancetype)requestWithMethod:(NSString *)method
                             url:(NSString *)url
                       paraments:(NSDictionary *)paraments;

@end

