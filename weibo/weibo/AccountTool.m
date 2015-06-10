//
//  AccountTool.m
//  Weibo
//
//  Created by Apple on 14-10-23.
//  Copyright (c) 2014年 yulin. All rights reserved.
//

#import "AccountTool.h"
//#import "AccountModel.h"

#define AccountfilePath  [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject] stringByAppendingPathComponent:@"account.data"]

@implementation AccountTool
/**
 *存储数据
 */
+(void)save:(AccountModel *)accountModel
{
    //使用归档 (序列化)
    [NSKeyedArchiver archiveRootObject:accountModel toFile:AccountfilePath];
}
/**
 *读取数据
 */
+(AccountModel *)accountModel
{
    //解析归档数据(反序列化)
    //读取账号
    AccountModel *account = [NSKeyedUnarchiver unarchiveObjectWithFile:AccountfilePath];
    NSDate *now=[NSDate date];
    if ([now compare:account.expires_time] == NSOrderedDescending) {//过期
        account=nil;
    }
    return account;
}

/**
    NSOrderedAscending = -1L,  升序，越往右边越大
    NSOrderedSame, 相等，一样
    NSOrderedDescending 降序，越往右边越小
*/

/*
 我们仅仅只能对原生的类进行归档处理，当对自定义的类进行归档时，
 无法保存对象，只是需要在自定义类中实现NSCoding协议。
 原来所有原生的类都是实现了NSCoding协议，
 在归档的过程中进行了转码，所以才可以归档成功。
 */
@end
