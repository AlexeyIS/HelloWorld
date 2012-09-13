//
//  Model.h
//  HelloWorld
//
//  Created by Alexey Ledovskiy on 8/30/12.
//  Copyright (c) 2012 Alexey Ledovskiy. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol ModelDelgate
-(void) didFinishAddingStringsWithResult:(NSString*) result;
@end

@interface Model : NSObject
+(Model*)sharedInstance;
-(void) addString:(NSString*)str1 toString:(NSString*)str2;
@property (nonatomic, strong) id<ModelDelgate> delegate;
@property (nonatomic, strong) NSString *result;
@end
