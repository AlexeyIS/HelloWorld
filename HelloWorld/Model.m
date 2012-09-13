//
//  Model.m
//  HelloWorld
//
//  Created by Alexey Ledovskiy on 8/30/12.
//  Copyright (c) 2012 Alexey Ledovskiy. All rights reserved.
//

#import "Model.h"

@implementation Model
@synthesize delegate,result;

static Model *_instance = nil;

+ (id)sharedInstance {
    if(_instance == nil){
        _instance = [Model new];
    }
    return _instance;
}

-(void) addString:(NSString*)str1 toString:(NSString*)str2
{
    self.result = [NSString stringWithFormat:@"%@%@",str1,str2];
    [self.delegate didFinishAddingStringsWithResult:self.result];
}


@end
