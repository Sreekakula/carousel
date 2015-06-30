//
//  ViewController.h
//  iCarousel Application
//
//  Created by Kiranmai Sreekakula01 on 30/06/15.
//  Copyright (c) 2015 Kiranmai Sreekakula01. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iCarousel.h"

@interface ViewController : UIViewController<iCarouselDataSource,iCarouselDelegate>
@property (strong, nonatomic) NSMutableArray *animals;
@property (strong, nonatomic) NSMutableArray *descriptions;
@property (nonatomic) BOOL wrap;

@end

