//
//  WeiXin.m
//  weixin
//
//  Created by chen on 2023/7/5.
//  Copyright © 2023 chen. All rights reserved.
//

#import "WeiXin.h"

@implementation WeiXin

//用dict为模型赋值
- (instancetype)initWithDict:(NSDictionary *)dict{
    if([super init]){
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)weixinWithDict:(NSDictionary *)dict{
    return [[self alloc] initWithDict:dict];
    NSLog(@"weixin的init方法！！！");
}

@end
 
