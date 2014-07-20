//
//  DHViewController.m
//  AirbnbLoadingView
//
//  Created by binaryboy on 7/20/14.
//  Copyright (c) 2014 AhmedHamdy. All rights reserved.
//

#import "DHViewController.h"
#import <QuartzCore/QuartzCore.h>
@interface DHViewController ()

@end

@implementation DHViewController{
    NSArray *images;
    int count;
}
@synthesize loadingImage=_loadingImage;
- (void)viewDidLoad
{
    [super viewDidLoad];
    images = [NSArray arrayWithObjects:@"1.jpg",@"2.jpg",@"3.jpg",@"4.jpg", nil];
	// Do any additional setup after loading the view, typically from a nib.
    count = 0;
    //[self rotate];

    [self rotateImageView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)rotateImageView
{
        if (count == [images count]-1) {
            count = 0;
        }
    [UIView animateWithDuration:.5 delay:0 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
        //[_loadingImage setTransform:CGAffineTransformRotate(_loadingImage.transform, M_PI)];
        _loadingImage.layer.transform = CATransform3DConcat(_loadingImage.layer.transform, CATransform3DMakeRotation(M_PI_2,0.0,1.0,0.0));

    }completion:^(BOOL finished){
        if (finished) {
            ++count;
            _loadingImage.image = [UIImage imageNamed:[images objectAtIndex:count]];
            [self rotateImageView];
        }
    }];
}
@end
