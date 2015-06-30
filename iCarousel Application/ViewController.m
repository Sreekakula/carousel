^//
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

@property (strong, nonatomic) IBOutlet iCarousel *carousel;
@end

@implementation ViewController
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        //set up carousel data
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
        [self.carousel setFrame:CGRectMake(0, 0, 320, 320)];
    }
    
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _carousel.type = iCarouselTypeCoverFlow2;
    
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
- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSUInteger)index
{
    //create a numbered view
    UIView *view = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[_animals objectAtIndex:index]]];
    return view;
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
- (void)carouselDidEndScrollingAnimation:(iCarousel *)aCarousel
{
    lastIndexpath = aCarousel.currentItemIndex;
    [self performSegueWithIdentifier:@"pushToSecondViewController" sender:self];
    
    
//    [label setText:[NSString stringWithFormat:@"%@", [descriptions objectAtIndex:aCarousel.currentItemIndex]]];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"pushToSecondViewController"]) {
    secondViewController *viewcontrollerInstance = (secondViewController *)[segue destinationViewController];
    viewcontrollerInstance.textfromFistView =[self.descriptions objectAtIndex:lastIndexpath];
    }
}

@end
