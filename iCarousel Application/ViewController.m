//
//  ViewController.m
//  iCarousel Application
//
//  Created by Kiranmai Sreekakula01 on 30/06/15.
//  Copyright (c) 2015 Kiranmai Sreekakula01. All rights reserved.
//

#import "ViewController.h"
#import "secondViewController.h"


@interface ViewController () {
    NSInteger lastIndexpath;
}


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _carousel.type = iCarouselTypeCoverFlow2;
    self.wrap = NO;
    
    self.animals = [NSMutableArray arrayWithObjects:@"images.jpeg",
                    @"images.jpeg",
                    @"images.jpeg",
                    @"images.jpeg",
                    @"images.jpeg",
                    @"images.jpeg",
                    @"images.jpeg",
                    nil];
    
    self.descriptions = [NSMutableArray arrayWithObjects:@"Bears Eat: Honey",
                         @"Zebras Eat: Grass",
                         @"Tigers Eat: Meat",
                         @"Goats Eat: Weeds",
                         @"Birds Eat: Seeds",
                         @"Giraffes Eat: Trees",
                         @"Chimps Eat: Bananas",
                         nil];
    [_carousel reloadData];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft || interfaceOrientation == UIInterfaceOrientationLandscapeRight);
}

- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    return [_animals count];
}

- (NSUInteger)numberOfVisibleItemsInCarousel:(iCarousel *)carousel
{
    //limit the number of items views loaded concurrently (for performance reasons)
    return 7;
}


- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view
{
    
    UIButton *button = (UIButton *)view;
    if (button == nil)
    {
        //no button available to recycle, so create new one
        UIImage *image =  [UIImage imageNamed:[_animals objectAtIndex:index]];
        button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(0.0f, 0.0f, 320, image.size.height);
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setBackgroundImage:image forState:UIControlStateNormal];
        button.titleLabel.font = [button.titleLabel.font fontWithSize:50];
        [button addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
    }
  
    return button;
}

- (NSInteger)numberOfPlaceholdersInCarousel:(iCarousel *)carousel
{
    //note: placeholder views are only displayed on some carousels if wrapping is disabled
    return 0;
}


- (CGFloat)carouselItemWidth:(iCarousel *)carousel
{
    //usually this should be slightly wider than the item views
    return 240;
}
- (BOOL)carouselShouldWrap:(iCarousel *)carousel
{
    //wrap all carousels
    return self.wrap;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"pushToSecondViewController"]) {
    UINavigationController *navcon = [segue destinationViewController];
        secondViewController *instance =[navcon.viewControllers objectAtIndex:0];
    instance.data =[self.descriptions objectAtIndex:lastIndexpath];
    }
}
- (void)buttonTapped:(UIButton *)sender
{
    //get item index for button
    NSInteger index = [self.carousel indexOfItemViewOrSubview:sender];
    lastIndexpath = index;
    
   [self performSegueWithIdentifier:@"pushToSecondViewController" sender:self];}
@end
