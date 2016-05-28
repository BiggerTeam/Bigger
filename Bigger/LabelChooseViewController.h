//
//  LabelChooseViewController.h
//  Bigger
//
//  Created by Huang on 16/5/16.
//  Copyright © 2016年 Huang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AFNetworking.h>
#import <SVProgressHUD.h>
#import "BiggerServerAPITools.h"

@interface LabelChooseViewController : UIViewController

//接口所需參數
@property(strong,nonatomic) NSString *phonenumber;
@property(strong,nonatomic) NSMutableString *labellist;

- (IBAction)labelchooseButtonDidPress:(UIButton *)Button;

- (IBAction)completeButtonDidPress:(id)sender;

@end
