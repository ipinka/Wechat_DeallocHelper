//
//  DeallocHelper.h
//  DeallocHelper
//
//  Created by Pinka on 15-4-10.
//  Copyright (c) 2015年 Pinka. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^DeallocHelperBlock)(void);

@interface DeallocHelper : NSObject

@property (copy, nonatomic) DeallocHelperBlock callback;
@property (unsafe_unretained, nonatomic) id target;

+ (void)attachToObject:(id)object key:(const void*)key whenDeallocDoThis:(DeallocHelperBlock)aThis;
+ (void)dettachObject:(id)object key:(const void*)key;

@end
