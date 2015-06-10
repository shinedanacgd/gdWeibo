//
//  AccountModel.h
//  Weibo
//
//  Created by Apple on 14-10-23.
//  Copyright (c) 2014年 yulin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AccountModel : NSObject <NSCoding>
/**access_token    string    
 用于调用access_token，接口获取授权后的access token。*/
@property(nonatomic,copy)NSString *access_token;

/**expires_in    string    
 access_token的生命周期，单位是秒数。*/
@property(nonatomic,copy)NSString *expires_in;

/**
*expires_time    nsdate    access_token的过期时间。
 */
@property(nonatomic,copy) NSDate *expires_time;

/**uid    string    
 当前授权用户的UID。*/
@property(nonatomic,copy)NSString *uid;

+(instancetype)accountModelWithDcit:(NSDictionary *)dict;

@end
