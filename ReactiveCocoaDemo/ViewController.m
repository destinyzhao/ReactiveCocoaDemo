//
//  ViewController.m
//  ReactiveCocoaDemo
//
//  Created by Destiny on 2020/7/13.
//  Copyright © 2020 Destiny. All rights reserved.
//

#import "ViewController.h"
#import "UIButtonViewController.h"
#import "TextFieldViewController.h"
#import "LoginViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.dataArray = @[@"UIButton",@"TextFieldChange",@"登录"];
    [self.tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *cellIdentifier = @"";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44.f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
            [self gotoUIButton];
            break;
        case 1:
            [self gotoTextField];
            break;
        case 2:
            [self gotoLogin];
            break;
            
        default:
            break;
    }
}

- (void)gotoUIButton{
    UIButtonViewController *vc = [[UIButtonViewController alloc] initWithNibName:@"UIButtonViewController" bundle:[NSBundle mainBundle]];
    [self.navigationController pushViewController:vc animated:YES];
}


- (void)gotoTextField{
    TextFieldViewController *vc = [[TextFieldViewController alloc] initWithNibName:@"TextFieldViewController" bundle:[NSBundle mainBundle]];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)gotoLogin{
    LoginViewController *vc = [[LoginViewController alloc] initWithNibName:@"LoginViewController" bundle:[NSBundle mainBundle]];
    [self.navigationController pushViewController:vc animated:YES];
}




@end
