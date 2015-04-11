//
//  DeallocHelper.m
//  DeallocHelper
//
//  Created by Pinka on 15-4-10.
//  Copyright (c) 2015年 Pinka. All rights reserved.
//

#import "DeallocHelper.h"

#import <objc/runtime.h>

@implementation DeallocHelper

+ (void)attachToObject:(id)object key:(const void*)key whenDeallocDoThis:(DeallocHelperBlock)aThis
{
    if (object) {
        DeallocHelper *tmpHelper = objc_getAssociatedObject(object, key);
        if (!tmpHelper) {
            DeallocHelper *helper = [[DeallocHelper alloc] init];
            helper.target = object;
            helper.callback = aThis;
            objc_setAssociatedObject(object, key, helper, OBJC_ASSOCIATION_RETAIN);
        }
    }
}

+ (void)dettachObject:(id)object key:(const void*)key
{
    if (object) {
        DeallocHelper *tmpHelper = objc_getAssociatedObject(object, key);
        if (tmpHelper) {
            tmpHelper.target = nil;
        }
        objc_setAssociatedObject(object, key, nil, OBJC_ASSOCIATION_RETAIN);
    }
}

- (void)dealloc
{
    if (_target && _callback) {
        _callback();
    }
}

@end
