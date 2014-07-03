//
//  WebController.m
//  Quest
//
//  Created by Admin on 02.07.14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import "WebController.h"

@interface WebController ()

@end

@implementation WebController

- (void)viewDidLoad
{
    [super viewDidLoad];
   
    UINavigationBar * Bar = [[self navigationController]navigationBar];
    Bar.translucent = NO;
    
    UIWebView* webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:webView];
    
    NSURL* url = [NSURL URLWithString:@"http://yandex.ru"];
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    
    [webView loadRequest:request];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
