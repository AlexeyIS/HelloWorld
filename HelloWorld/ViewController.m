//
//  ViewController.m
//  HelloWorld
//
//  Created by Alexey Ledovskiy on 8/30/12.
//  Copyright (c) 2012 Alexey Ledovskiy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize model;
@synthesize arg1;
@synthesize arg2;
@synthesize res;
- (void)viewDidLoad
{
    self.model = [[Model alloc]init];
    [self.model setDelegate:self];
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)addButton:(id)sender {
    [self.model addString:self.arg1.text toString:self.arg2.text];
}
-(void)didFinishAddingStringsWithResult:(NSString *)result
{
    self.res.text = result;

}

- (void)viewDidUnload
{
    [self setArg1:nil];
    [self setArg2:nil];
    [self setRes:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

@end
