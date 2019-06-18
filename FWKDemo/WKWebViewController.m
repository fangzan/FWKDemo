//
//  WKWebViewController.m
//  FWKDemo
//
//  Created by AoChen on 2019/6/5.
//  Copyright © 2019 Ac. All rights reserved.
//

#import "WKWebViewController.h"
#import <WebKit/WebKit.h>
@interface WKWebViewController ()<WKUIDelegate,WKNavigationDelegate,UIScrollViewDelegate>
@property (nonatomic, strong) WKWebView *webView;

@end

@implementation WKWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _webView = [[WKWebView alloc] initWithFrame:self.view.bounds];
    _webView.UIDelegate = self;
    _webView.navigationDelegate = self;
    _webView.scrollView.delegate = self;
    [self.view addSubview:_webView];
    // 2.创建请求
    NSMutableURLRequest *request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"https://jhc3777.com/Account/CustomerServiceChatRoom?loginID=yu68889"]];
    // 3.加载网页
    [_webView loadRequest:request];

    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(willshowKeyBoardClick) name:UIKeyboardWillShowNotification object:nil];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
//    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

//键盘弹起监听
- (void)willshowKeyBoardClick
{
    NSArray *arr = [UIApplication sharedApplication].windows;
    for (NSInteger i = 0; i < arr.count; i++) {
        if ([arr[i] isKindOfClass:[NSClassFromString(@"UITextEffectsWindow") class]]) {
            if (![arr[i] isKindOfClass:[NSClassFromString(@"UIRemoteKeyboardWindow") class]]) {
                UIWindow *window = arr[i];
                UIView *view = [window.rootViewController.view.subviews lastObject];
                if (view.subviews.count > 1) {
                    for (NSInteger j = 0;j < view.subviews.count; j++) {
                        if ([view.subviews[j] isKindOfClass:NSClassFromString(@"UIKBInputBackdropView")] ||
                            [view.subviews[j] isKindOfClass:NSClassFromString(@"UIWebFormAccessory")]) {
                            UIView *subView = view.subviews[j];
                            subView.alpha = 0.0;
                        }
                    }
                    break;
                }
            }
        }
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"PY:%.2f",scrollView.contentOffset.y);
    
    if (scrollView.contentOffset.y < 280) {
        [self.view endEditing:YES];
    }
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation
{
    //获取整个网页的HTML代码
    NSString *doc =@"document.body.outerHTML";
    [webView evaluateJavaScript:doc completionHandler:^(id _Nullable htmlStr, NSError * _Nullable error) {
        if (error) {
            NSLog(@"JSError:%@",error);
        }
        NSLog(@"html--:%@",htmlStr);
    }];
    
//    //获取当前页面的url
//    NSString *doc01 =@"document.location.href";
//    [webView evaluateJavaScript:doc01 completionHandler:^(id _Nullable htmlStr, NSError * _Nullable error) {
//        if (error) {
//            NSLog(@"JSError:%@",error);
//        }
//        NSLog(@"url--:%@",htmlStr);
//    }];

    //获取页面的title
    NSString *doc02 =@"document.title";
    [webView evaluateJavaScript:doc02 completionHandler:^(id _Nullable htmlStr, NSError * _Nullable error) {
        if (error) {
            NSLog(@"JSError:%@",error);
        }
        NSLog(@"url--:%@",htmlStr);
    }];
    
    NSString *str = @"document.getElementsByClassName('navtop')[0].remove();";
    [webView evaluateJavaScript:str completionHandler:nil];
    
    NSString *str03 = @"$('.clearfix').eq(0).find('div').eq(0).css('width','80%').css('padding','0px'); $('.clearfix').eq(0).find('div').eq(1).removeAttr('style').css('padding','0px').css('float','left').css('width','20%'); $('.clearfix').eq(0).find('div').eq(1).find('.gold-btn').css('margin-left','50%').css('left','-25px').css('position','relative')";
    [webView evaluateJavaScript:str03 completionHandler:nil];
    
    // .css('margin-left','50%').css('left','-25px')
//    //修改界面的元素的值
//    NSString *doc03 =@"document.body.outerHTML";
//    [webView evaluateJavaScript:doc03 completionHandler:^(id _Nullable htmlStr, NSError * _Nullable error) {
//        if (error) {
//            NSLog(@"JSError:%@",error);
//        }
//        NSLog(@"修改元素--:%@",htmlStr);
//    }];
    
//    //提交表单
//    NSString *doc04 =@"document.forms[0].submit();";
//    [webView evaluateJavaScript:doc04 completionHandler:^(id _Nullable htmlStr, NSError * _Nullable error) {
//        if (error) {
//            NSLog(@"JSError:%@",error);
//        }
//        NSLog(@"提交表单--:%@",htmlStr);
//    }];
    
//    //获取所有的HTML
//    NSString *doc05 =@"document.documentElement.innerHTML";
//    [webView evaluateJavaScript:doc05 completionHandler:^(id _Nullable htmlStr, NSError * _Nullable error) {
//        if (error) {
//            NSLog(@"JSError:%@",error);
//        }
//        NSLog(@"获取所有的HTML--:%@",htmlStr);
//    }];

//    //获取网页的一个值
//    NSString *doc06 =@"document.getElementById('title').innerText";
//    [webView evaluateJavaScript:doc06 completionHandler:^(id _Nullable htmlStr, NSError * _Nullable error) {
//        if (error) {
//            NSLog(@"JSError:%@",error);
//        }
//        NSLog(@"获取网页的一个值--:%@",htmlStr);
//    }];
    
//    //获取网页内容的高度
//    NSString *doc07 = @"document.body.offsetHeight;";
//    [webView evaluateJavaScript:doc07 completionHandler:^(id _Nullable htmlStr, NSError * _Nullable error) {
//        if (error) {
//            NSLog(@"JSError:%@",error);
//        }
//        NSString *heightStr = [NSString stringWithFormat:@"%@",htmlStr];
//        NSLog(@"获取网页的一个值--:%@",heightStr);
//    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
