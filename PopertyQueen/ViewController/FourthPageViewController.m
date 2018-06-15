//
//  FourthPageViewController.m
//  PopertyQueenMalaysia
//
//  Created by MacBook Pro Retina on 30/4/18.
//  Copyright © 2018 MacBook Pro Retina. All rights reserved.
//

#import "FourthPageViewController.h"

@interface FourthPageViewController ()
{
    __weak IBOutlet UIScrollView *scrollView;
    __weak IBOutlet UITextView *textView;
}

@end

@implementation FourthPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGSize size=CGSizeMake(self.view.frame.size.width-2*10, self.view.frame.size.height);
    int i=0;
    NSString *name;
    for(i=0;i<17;i++)
    {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(i * size.width, 0, size.width, size.height)];
        name=@"";
        name=[name stringByAppendingString:[NSString stringWithFormat:@"%@%d%@",@"image",i,@".jpg"]];
        imageView.image=[UIImage imageNamed:name];
        [scrollView addSubview:imageView];
        
    }
    scrollView.contentSize = CGSizeMake(i*size.width, 0);
    scrollView.pagingEnabled = YES;
    scrollView.showsVerticalScrollIndicator=NO;
    scrollView.showsHorizontalScrollIndicator=NO;
    scrollView.bounces=NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)gotoMorePage:(id)sender {
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
