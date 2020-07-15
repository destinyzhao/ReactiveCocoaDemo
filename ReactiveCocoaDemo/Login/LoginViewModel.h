//
//  LoginViewModel.h
//  ReactiveCocoaDemo
//
//  Created by Destiny on 2020/7/15.
//  Copyright © 2020 Destiny. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Account.h"

NS_ASSUME_NONNULL_BEGIN

@interface LoginViewModel : NSObject

//用户账号数据模型
@property (nonatomic, strong) Account *account;

// 是否允许登录的信号
@property (nonatomic, strong, readonly) RACSignal *enableLoginSignal;

@property (nonatomic, strong, readonly) RACCommand *LoginCommand;

@end

NS_ASSUME_NONNULL_END
