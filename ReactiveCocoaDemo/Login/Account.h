//
//  Account.h
//  ReactiveCocoaDemo
//
//  Created by Destiny on 2020/7/15.
//  Copyright © 2020 Destiny. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Account : NSObject

//账号
@property (nonatomic, copy) NSString *userName;

//密码
@property (nonatomic, copy) NSString *password;

@end

NS_ASSUME_NONNULL_END
