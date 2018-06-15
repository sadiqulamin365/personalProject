//
//  MainViewController.m
//  PopertyQueenMalaysia
//
//  Created by MacBook Pro Retina on 30/4/18.
//  Copyright © 2018 MacBook Pro Retina. All rights reserved.
//

#import "MainViewController.h"
#import "SWRevealViewController.h"
#import "FifthPageViewController.h"
#import "SixthPageViewController.h"


@interface MainViewController ()
{
    NSMutableArray *viewControllerConatiner;
    NSMutableArray *indentifier;
    UIViewController *initialViewController;
    UIScrollView *scrollView;
}

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.menuBarButton setTarget: self.revealViewController];
        [self.menuBarButton setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
    indentifier=[[NSMutableArray alloc]init];
    [indentifier addObject:@"FirstPageViewController"];
    [indentifier addObject:@"SecondPageViewController"];
    [indentifier addObject:@"ThirdPageViewController"];
    [indentifier addObject:@"FourthPageViewController"];
    [indentifier addObject:@"FifthPageViewController"];
    [indentifier addObject:@"SixthPageViewController"];
    [indentifier addObject:@"SeventhPageViewController"];
    
     
    viewControllerConatiner=[[NSMutableArray alloc]init];
    
     UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    
    for(int i=0;i<indentifier.count;i++)
    {
        UIViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:indentifier[i]];
        initialViewController=viewController;
        [viewControllerConatiner addObject:viewController];
    }
    
    [self performSelector:@selector(updateView) withObject:self afterDelay:0.1 ];
   
}
-(void)updateView
{
    
    
    
    scrollView = [[UIScrollView alloc] init];
    scrollView.frame = initialViewController.view.frame;
    [self.view addSubview:scrollView];
    
    
    for(int i=0;i<viewControllerConatiner.count;i++)
    {
        UIViewController *view=viewControllerConatiner[i];
        CGRect frame = view.view.frame;
        frame.origin.y = i*scrollView.frame.size.height;
        view.view.frame = frame;
        [self addChildViewController:view];
        [scrollView addSubview:view.view];
    }
    
    scrollView.contentSize = CGSizeMake(0, (viewControllerConatiner.count)*scrollView.frame.size.height);
    scrollView.pagingEnabled = YES;
    scrollView.showsVerticalScrollIndicator=NO;
    scrollView.showsHorizontalScrollIndicator=NO;
    scrollView.bounces=NO;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
