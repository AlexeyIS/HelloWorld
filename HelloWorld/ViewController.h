//
//  ViewController.h
//  HelloWorld
//
//  Created by Alexey Ledovskiy on 8/30/12.
//  Copyright (c) 2012 Alexey Ledovskiy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model.h"
@interface ViewController : UIViewController <ModelDelgate>
@property (nonatomic,strong) Model *model;
@property (assign, nonatomic) IBOutlet UITextField *arg1;
@property (assign, nonatomic) IBOutlet UITextField *arg2;
@property (assign, nonatomic) IBOutlet UITextField *res;
@end
