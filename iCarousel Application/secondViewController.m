//
//  secondViewController.m
//  iCarousel Application
//
//  Created by Kiranmai Sreekakula01 on 30/06/15.
//  Copyright (c) 2015 Kiranmai Sreekakula01. All rights reserved.
//

#import "secondViewController.h"

@interface secondViewController ()

@end

@implementation secondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _textfromFistView.text= self.data;
    UIBarButtonItem *back = self.navigationItem.leftBarButtonItem;
    [back setAction:@selector(goBack)];
    [back setTarget:self];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)goBack {
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
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
