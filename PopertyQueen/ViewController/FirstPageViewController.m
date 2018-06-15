//
//  FirstPageViewController.m
//  PopertyQueenMalaysia
//
//  Created by MacBook Pro Retina on 30/4/18.
//  Copyright © 2018 MacBook Pro Retina. All rights reserved.
//

#import "FirstPageViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>


@interface FirstPageViewController ()
{
    __weak IBOutlet UIScrollView *scrollView;
    __weak IBOutlet UIView *containerView;
    NSMutableArray *currentArray;
}

@end

@implementation FirstPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    currentArray=[[NSMutableArray alloc]init];
    containerView.backgroundColor=[[UIColor blackColor]colorWithAlphaComponent:0.5];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    
}



-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    if(currentArray.count<=0)
    {
        
        dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            NSError *error;
            NSString *url_string = [NSString stringWithFormat: @"http://beta.propertyqueen.com.my/AppService/GetHomeSliderForHomePage"];
            NSData *data = [NSData dataWithContentsOfURL: [NSURL URLWithString:url_string]];
            NSMutableArray *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
            
            if(error==nil)
            {
                
                self->currentArray=json;
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    CGSize size=self.view.frame.size;
                    int i=0;
                    NSString *name;
                    NSString *link=@"https://www.propertyqueen.com.my/";
                    for(i=0;i<json.count;i++)
                    {
                        NSDictionary *dic=json[i];
                        
                        
                        
                        
                        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(i * size.width, 0, size.width, size.height)];
                        name=@"";
                        name=[name stringByAppendingString:[NSString stringWithFormat:@"%@%d%@",@"image",i,@".jpg"]];
                        imageView.contentMode=UIViewContentModeScaleToFill;
                        [imageView setClipsToBounds:YES];
                        [imageView sd_setImageWithURL:[NSURL URLWithString:[link stringByAppendingString:[dic objectForKey:@"DesktopSliderUrl"]]]
                                     placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
                        [self->scrollView addSubview:imageView];
                        
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

- (IBAction)gotoCommonPage:(id)sender {
    UIButton *btn=(UIButton*)sender;
    
    
    UIButton *btn1=(UIButton*)[self.view viewWithTag:5001];
    UIButton *btn2=(UIButton*)[self.view viewWithTag:5002];
    UIButton *btn3=(UIButton*)[self.view viewWithTag:5003];
    
    if(btn.tag==btn1.tag)
    {
        btn1.backgroundColor=[UIColor redColor];
        btn2.backgroundColor=[UIColor clearColor];
        btn3.backgroundColor=[UIColor clearColor];
        
    }
    else if(btn.tag==btn2.tag)
    {
        btn2.backgroundColor=[UIColor redColor];
        btn1.backgroundColor=[UIColor clearColor];
        btn3.backgroundColor=[UIColor clearColor];
    }
    else{
        
        btn3.backgroundColor=[UIColor redColor];
        btn1.backgroundColor=[UIColor clearColor];
        btn2.backgroundColor=[UIColor clearColor];
    }
    
    
}
@end
