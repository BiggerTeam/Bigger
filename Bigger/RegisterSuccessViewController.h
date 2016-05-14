//
//  RegisterSuccessViewController.h
//  Bigger
//
//  Created by Huang on 16/5/14.
//  Copyright © 2016年 Huang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisterSuccessViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UITextField *repeatpasswordTextField;


- (IBAction)nextstepButtonDidPress:(id)sender;
@end
