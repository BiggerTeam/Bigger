//
//  LoginViewController.m
//  Bigger
//
//  Created by Departures on 5/9/16.
//  Copyright © 2016 Departures. All rights reserved.
//

#import "LoginViewController.h"
@implementation LoginViewController

-(void)viewDidLoad{
    
    
}


- (IBAction)loginButtonDidPress:(id)sender {
    [self doErrorMessage];
   }

-(void)doErrorMessage{
    [HHAlertView showAlertWithStyle:HHAlertStyleError inView:self.view Title:@"登录失败" detail:@"账户或密码错误" cancelButton:nil Okbutton:@"知道了"];

}

    
@end
