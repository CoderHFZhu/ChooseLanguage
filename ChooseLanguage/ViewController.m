//
//  ViewController.m
//  ChooseLanguage
//
//  Created by CoderHF on 2018/3/8.
//  Copyright © 2018年 CoderHF. All rights reserved.
//

#import "ViewController.h"
#import "NSBundle+Language.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *chineseBtn;
@property (weak, nonatomic) IBOutlet UIButton *englishBtn;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view, typically from a nib.
   
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(30, 30, 100, 50);
    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(clickBtn1:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    self.chineseBtn = btn;
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn1.frame = CGRectMake(30, 100, 100, 50);
    btn1.backgroundColor = [UIColor redColor];

    [btn1 addTarget:self action:@selector(clickBtn2:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    self.englishBtn = btn1;
    [self.chineseBtn setTitle:NSLocalizedString(@"btn1", nil) forState:UIControlStateNormal];
    [self.englishBtn setTitle:NSLocalizedString(@"btn2", nil) forState:UIControlStateNormal];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)clickBtn1:(id)sender {
    [self changeLanguageTo:@"zh-Hans"];

}
- (void)clickBtn2:(id)sender {
    [self changeLanguageTo:@"en"];

}
- (void)changeLanguageTo:(NSString *)language {
    // 设置语言
    [NSBundle setLanguage:language];
    
    // 然后将设置好的语言存储好，下次进来直接加载
    [[NSUserDefaults standardUserDefaults] setObject:language forKey:@"myLanguage"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
        [UIApplication sharedApplication].keyWindow.rootViewController = [[ViewController alloc] init];
}
@end
