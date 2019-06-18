//
//  ViewController.m
//  FWKDemo
//
//  Created by AoChen on 2019/6/5.
//  Copyright © 2019 Ac. All rights reserved.
//

#import "ViewController.h"
#import "WKWebViewController.h"
@interface ViewController ()
@property (nonatomic, strong) UIView *webBgView;
@property (nonatomic, strong) WKWebViewController *webViewController;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _webBgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame))];
    [self.view addSubview:_webBgView];
    
    
    
//    // 2.创建请求
//    NSMutableURLRequest *request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"https://jhc3777.com/Account/CustomerServiceChatRoom?loginID=yu68889"]];
//    // 3.加载网页
//    [_webView loadRequest:request];
}

- (WKWebViewController *)webViewController
{
    if (!_webViewController) {
        _webViewController = [[WKWebViewController alloc] init];
    }
    return _webViewController;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.navigationController pushViewController:self.webViewController animated:YES];
}





@end
