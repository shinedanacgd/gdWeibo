//
//  AccountTool.h
//  Weibo
//
//  Created by Apple on 14-10-23.
//  Copyright (c) 2014年 yulin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AccountModel.h"

@interface AccountTool : NSObject
/**
*存储数据
*/
+(void)save:(AccountModel *)accountModel;
/**
*读取数据
*/
+(AccountModel *)accountModel;
@end
