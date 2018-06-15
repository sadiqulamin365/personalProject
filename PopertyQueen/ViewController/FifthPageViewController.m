//
//  FifthPageViewController.m
//  PopertyQueenMalaysia
//
//  Created by MacBook Pro Retina on 1/5/18.
//  Copyright © 2018 MacBook Pro Retina. All rights reserved.
//

#import "FifthPageViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface FifthPageViewController ()
{
    __weak IBOutlet UIScrollView *scrollView;
    __weak IBOutlet UITextView *textView;
    NSMutableArray *currentArray;
}

@end

@implementation FifthPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    currentArray=[[NSMutableArray alloc]init];
   
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
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    
    NSString *link=@"https://www.propertyqueen.com.my/";
    
    if(currentArray.count<=0)
    {
        
        dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            NSError *error;
            NSString *url_string = [NSString stringWithFormat: @"http://beta.propertyqueen.com.my/AppService/GetVideoForHomePage"];
            NSData *data = [NSData dataWithContentsOfURL: [NSURL URLWithString:url_string]];
            NSMutableArray *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
             NSLog(@"%@",json);
            if(error==nil)
            {
               
                self->currentArray=json;
                
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    CGSize size=CGSizeMake(self->scrollView.frame.size.width, self->scrollView.frame.size.height);
                    int i=0;
                   
                   
                    for(i=0;i<self->currentArray.count;i++)
                    {
                        NSDictionary *dic=self->currentArray[i];
                        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(i * size.width, 0, size.width, size.height)];
                        UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(i * size.width, 0, size.width, size.height)];
                        btn.tag=8000+i;
                        [btn addTarget:self action:@selector(okButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
                        UILabel *lbl=[[UILabel alloc]initWithFrame:CGRectMake(i*size.width, (imageView.frame.size.height-70), size.width, 70)];
                        lbl.backgroundColor=[[UIColor blackColor]colorWithAlphaComponent:0.4];
                        lbl.text=[dic objectForKey:@"VideoName"];
                        lbl.textColor=[UIColor whiteColor];
                        [lbl setFont:[UIFont systemFontOfSize:12]];
                        
                        
                        imageView.contentMode=UIViewContentModeScaleToFill;
                        [imageView setClipsToBounds:YES]; 
                        
                        [imageView sd_setImageWithURL:[NSURL URLWithString:[link stringByAppendingString:[dic objectForKey:@"CoverPhoto"]]]
                                     placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
                        [self->scrollView addSubview:imageView];
                        [self->scrollView addSubview:lbl];
                        [self->scrollView addSubview:btn];
                        [self->scrollView bringSubviewToFront:btn];
                        
                        
                        
                    }
                    self->scrollView.contentSize = CGSizeMake(i*size.width, 0);
                    self->scrollView.pagingEnabled = YES;
                    self->scrollView.showsVerticalScrollIndicator=NO;
                    self->scrollView.showsHorizontalScrollIndicator=NO;
                    self->scrollView.bounces=NO;
                });
              
                
                
            }
        });
    }
    
    
}
- (void)okButtonTapped:(UIButton *)sender {
    UIButton *btn=(UIButton *)sender;
    NSDictionary *dic=currentArray[btn.tag-8000];
    NSString *path=[dic objectForKey:@"VideoLink"];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:path]];

    
}
- (IBAction)gotoMorePage:(id)sender {
    
    NSString *path=@"https://www.youtube.com/channel/UCYf8X15R6u0kVtoAKTuslxQ";
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:path]];}

@end
