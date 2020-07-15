//
//  LoginViewModel.m
//  ReactiveCocoaDemo
//
//  Created by Destiny on 2020/7/15.
//  Copyright © 2020 Destiny. All rights reserved.
//

#import "LoginViewModel.h"

@implementation LoginViewModel


- (Account *)account
{
    if (_account == nil) {
        _account = [[Account alloc] init];
    }
    return _account;
}
- (instancetype)init
{
    if (self = [super init]) {
        [self initialBind];
    }
    return self;
}

// 初始化绑定
- (void)initialBind
{
    // 监听账号的属性值改变，把他们聚合成一个信号。
    _enableLoginSignal = [RACSignal combineLatest:@[RACObserve(self.account, userName),RACObserve(self.account, password)] reduce:^id(NSString *userName,NSString *password){
        return @(userName.length && password.length);

    }];

    // 处理登录业务逻辑
    _LoginCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {

        NSLog(@"点击了登录");
        return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {

            // 模仿网络延迟
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{

                [subscriber sendNext:@"登录成功"];

                // 数据传送完毕，必须调用完成，否则命令永远处于执行状态
                [subscriber sendCompleted];
            });

            return nil;
        }];
    }];

    // 监听登录产生的数据
    [_LoginCommand.executionSignals.switchToLatest subscribeNext:^(id x) {

        if ([x isEqualToString:@"登录成功"]) {
            NSLog(@"登录成功");
        }
    }];

}

@end
