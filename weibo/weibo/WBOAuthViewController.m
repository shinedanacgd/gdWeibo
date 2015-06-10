//NewfeatureViewController *controller = [[NewfeatureViewController alloc]init];
//        WBOAuthViewController *controller = [[WBOAuthViewController alloc]init];
//        self.window.rootViewController = controller;//
//  WBOAuthViewController.m
//  Weibo
//
//  Created by Apple on 14-10-22.
//  Copyright (c) 2014年 yulin. All rights reserved.
//

#import "WBOAuthViewController.h"
//#import "MBProgressHUD.h"
#import "AccountTool.h"
#import "AFHTTPRequestOperationManager.h"


@interface WBOAuthViewController ()

@end

@implementation WBOAuthViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //1.创建UIWebView
    UIWebView *webView=[[UIWebView alloc]init];
    webView.frame=self.view.bounds;
    webView.delegate = self;
    [self.view addSubview:webView];
    
    //2.加载登陆界面
    NSURL *url=[NSURL URLWithString:@"https://api.weibo.com/oauth2/authorize?client_id=3651890567&redirect_uri=http://api.weibo.com/oauth2/default.html"];
    NSURLRequest *request=[[NSURLRequest alloc]initWithURL:url];
    [webView loadRequest:request];

}

#pragma mark-UIWebViewDelegate

/**
*  UIWebView开始加载资源的时候调用（开始发送请求）
*/
-(void)webViewDidStartLoad:(UIWebView *)webView
{
//    [MBProgressHUD showMessage:@"正在努力加载中···"];
}

/**
*  UIWebView加载完毕的时候调用（请求结束）
*/
-(void)webViewDidFinishLoad:(UIWebView *)webView
{
//    [MBProgressHUD hideHUD];
}

/**
*  UIWebView加载失败的时候调用（请求失败）
*/
-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
//    [MBProgressHUD hideHUD];
}
/**
*  UIWebView每当发送一个请求之前，都会先调用这个代理方法（询问代理允不允许加载这个请求）
*  @param request        即将发送的请求
*  @return YES允许加载，NO不允许加载
*/
-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    //1.获得请求地址
    NSString *urlStr=request.URL.absoluteString;
    //NSLog(@"--urlStr---%@",urlStr);
    
    //urlStr在字符串中的范围
    //设置从等号位置开始，不用再额外的找位置
    NSRange range=[urlStr rangeOfString:@"http://api.weibo.com/oauth2/default.html?code="];

    
    //判断是否为回调地址
    if (range.location!=NSNotFound) {
        //是回调地址
        //截取授权成功后的请求标记
        int from=range.location+range.length;
        NSString *code=[urlStr substringFromIndex:from];
        
        //根据code获得一个accessToken
        [self accessTokenWithCode:code];
       // NSLog(@"urlStr-%@---code-%@--",urlStr,code);
        //禁止加载回调页面，拿到想要的东西就好了。
        return NO;
    }
    return YES;
}

/**
*  根据code获得一个accessToken
*  @param code 授权成功后的请求标记
*/
-(void)accessTokenWithCode:(NSString *)code
{
    //处理操作....
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
//    mgr.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain"];
    NSMutableDictionary *params=[NSMutableDictionary dictionary];
    params[@"client_id"] =@"3651890567";
    params[@"client_secret"] =@"52c0e6da3dd1dbba5666696c53148612";
    params[@"grant_type"] =@"authorization_code";
    params[@"code"] =code;
    params[@"redirect_uri"] =@"http://api.weibo.com/oauth2/default.html";
    //3.发送Post请求
    [mgr POST:@"https://api.weibo.com/oauth2/access_token" parameters:params success:^(AFHTTPRequestOperation *operation, NSDictionary*responseObject) {
        NSLog(@"请求成功--%@",responseObject);
        
        //3.1存储授权成功的账号信息
        [AccountTool save:[AccountModel accountModelWithDcit:responseObject]];
        [WBControllerTool chooseRootViewController];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"请求失败--%@",error);
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
