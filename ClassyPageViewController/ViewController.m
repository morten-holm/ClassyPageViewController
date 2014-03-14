//
//  ViewController.m
//  ClassyPageViewController
//
//  Created by Morten Holm on 14/03/14.
//  Copyright (c) 2014 Morten Holm. All rights reserved.
//

#import "ViewController.h"
#import "CollectionViewViewController.h"
#import <Classy.h>

@interface ViewController ()
@property (nonatomic) NSArray *pages;
@end

@interface ViewController(UIPageViewControllerDataSource)<UIPageViewControllerDataSource>
@end

@interface ViewController(UIPageViewControllerDelegate)<UIPageViewControllerDelegate>
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view.cas_styleClass = @"mainView";

    NSMutableArray *collectionViews = [NSMutableArray array];
    for (int i = 0; i < 5; i++) {
        [collectionViews addObject: [[CollectionViewViewController alloc] init]];
    }
    self.pages = collectionViews;

    // Setting constraints on a UIPageViewController's view is like kicking yourself in the face
    // (child view controllers won't rotate correctly if they also use Auto Layout)


    UIPageViewController *controller = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll
                                                                       navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal
                                                                                     options:nil];

    controller.delegate = self;
    controller.dataSource = self;

    controller.view.frame = self.view.bounds;
    controller.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;

    [controller willMoveToParentViewController:self];
    [self addChildViewController:controller];
    [self.view addSubview:controller.view];
    [controller didMoveToParentViewController:self];

    [controller setViewControllers:@[[self.pages firstObject]] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

@implementation ViewController(UIPageViewControllerDataSource)
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    NSUInteger dataIndex = [self.pages indexOfObject:viewController];
    return dataIndex > 0 ? self.pages[dataIndex-1] : [self.pages lastObject];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    NSUInteger dataIndex = [self.pages indexOfObject:viewController];
    return dataIndex < self.pages.count-1 ? self.pages[dataIndex+1] : [self.pages firstObject];
}

@end

@implementation ViewController(UIPageViewControllerDelegate)

@end