//
//  CommonWeibo.h
//  weibo
//
//  Created by 陈广大 on 15/6/10.
//  Copyright (c) 2015年 chenguangda. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommonWeibo : NSObject
@property(nonatomic,copy)NSString *createdAt;
@property(nonatomic,copy)NSString *weiboId;
@property(nonatomic,copy)NSString *weiboMid;
@property(nonatomic,copy)NSString *idstr;
@property(nonatomic,copy)NSString *text;
@property(nonatomic,copy)NSString *source;
@property(nonatomic,assign)BOOL *favorited;
@property(nonatomic,assign)BOOL *truncated;
@property(nonatomic,copy)NSString *in_reply_to_status_id;
@property(nonatomic,copy)NSString *in_reply_to_user_id;
@property(nonatomic,copy)NSString *in_reply_to_screen_name;
@property(nonatomic,copy)NSString *thumbnail_pic;
@property(nonatomic,copy)NSString *bmiddle_pic;
@property(nonatomic,copy)NSString *original_pic;
@property(nonatomic,copy)NSDictionary *geo;
@property(nonatomic,copy)NSDictionary *user;
@property(nonatomic,copy)NSDictionary *retweeted_status;
@property(nonatomic,copy)NSString *reposts_count;
@property(nonatomic,copy)NSString *comments_count;
@property(nonatomic,copy)NSString *attitudes_count;
@property(nonatomic,copy)NSString *mlevel;
@property(nonatomic,copy)NSDictionary *visible;
@property(nonatomic,copy)NSDictionary *pic_ids;
@property(nonatomic,copy)NSArray *ad;
@end
