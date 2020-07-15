//
//  TextFieldViewController.m
//  ReactiveCocoaDemo
//
//  Created by Destiny on 2020/7/15.
//  Copyright © 2020 Destiny. All rights reserved.
//

#import "TextFieldViewController.h"

@interface TextFieldViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIButton *button;

@end

@implementation TextFieldViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    // 监听文本框的输入,而且只有大于3个长度的时候才会打印
    [[self.textField.rac_textSignal filter:^BOOL(NSString * _Nullable value) {
        return value.length > 3;
    }]subscribeNext:^(NSString * _Nullable x) {
        NSLog(@"%@", x);
        
    }];
    
    [self.textField.rac_textSignal subscribeNext:^(NSString * _Nullable x) {
        self.button.enabled = x.length>3?YES:NO;
    }];
    
    [[self.button rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(__kindof UIControl * _Nullable x) {
        NSLog(@"%@", @"按钮点击了");
    }];
    
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
