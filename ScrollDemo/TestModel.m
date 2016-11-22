//
//  TestModel.m
//  ScrollDemo
//
//  Created by cyln on 2016/11/21.
//  Copyright © 2016年 cyln. All rights reserved.
//

#import "TestModel.h"

@interface TestModel ()<NSCopying>

@end
@implementation TestModel

- (instancetype)init {
    if (self = [super init]) {
        self.name = @"你妹";
    }
    return self;
}
- (id)copyWithZone:(NSZone *)zone {
    return [[[self class] allocWithZone:zone] init];
}
@end
