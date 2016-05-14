//
//  MainLoginViewControllor.m
//  Bigger
//
//  Created by Huang on 16/5/8.
//  Copyright © 2016年 Huang. All rights reserved.
//

#import "MainLoginViewController.h"

@interface MainLoginViewController ()

@end

@implementation MainLoginViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



- (IBAction)loginButtonDidPress:(id)sender {
}

- (IBAction)forgetpasswordButtonDidPress:(id)sender {
}

- (IBAction)registerButtonDidPress:(id)sender {
}

- (IBAction)browseButtonDidPress:(id)sender {
}

//登录失败的弹窗
-(void)doErrorMessage{
    [HHAlertView showAlertWithStyle:HHAlertStyleError inView:self.view Title:@"登录失败" detail:@"账户或密码错误" cancelButton:nil Okbutton:@"我知道了"];
}

@end
