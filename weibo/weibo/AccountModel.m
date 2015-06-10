//
//  AccountModel.m
//  Weibo
//
//  Created by Apple on 14-10-23.
//  Copyright (c) 2014年 yulin. All rights reserved.
//

#import "AccountModel.h"

@implementation AccountModel
+(instancetype)accountModelWithDcit:(NSDictionary *)dict
{
    //注意，json中返回的数据和model中的成员属性不对应，因此不能直接使用KVC
    AccountModel *model=[[self alloc]init];
    model.access_token=dict[@"access_token"];
    model.expires_in=dict[@"expires_in"];
    model.uid=dict[@"uid"];
    //确定账号的过期时间= 账号创建的时间 + 有效期
    NSDate *now=[NSDate date];
    //如果是用自己的账号给自己的应用授权的话，有效期是5年，如果是用测试的账号给应用授权的话，有效期是1天。
    model.expires_time=[now dateByAddingTimeInterval:model.expires_in.doubleValue];
    return model;
}

/**
 *从文件中解析出一个对象的时候调用
 *在这个方法中写清楚：怎么解析文件中的数据
 */
-(id)initWithCoder:(NSCoder *)aDecoder
{
    if (self=[super init]) {
        self.access_token=[aDecoder decodeObjectForKey:@"access_token"];
        self.expires_in=[aDecoder decodeObjectForKey:@"expires_in"];
        self.uid=[aDecoder decodeObjectForKey:@"uid"];
    }
    return self;
}

/**
 *将对象写入到文件中的时候调用
 *在这个方法中写清楚：要存储哪些对象的哪些属性，以及怎样存储属性
 */
-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.access_token forKey:@"access_token"];
    [aCoder encodeObject:self.expires_in forKey:@"expires_in"];
    [aCoder encodeObject:self.uid forKey:@"uid"];
}
@end
