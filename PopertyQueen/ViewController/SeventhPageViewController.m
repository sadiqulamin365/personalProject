//
//  SeventhPageViewController.m
//  PopertyQueen
//
//  Created by MacBook Pro Retina on 19/5/18.
//  Copyright © 2018 MacBook Pro Retina. All rights reserved.
//

#import "SeventhPageViewController.h"
#import "CellContainerCollectionViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface SeventhPageViewController ()
{
     NSMutableArray *currentArray;
    __weak IBOutlet UICollectionView *collectionViewForSeventhPage;
}

@end

@implementation SeventhPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    currentArray=[[NSMutableArray alloc]init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    CGSize size;
    
    
    if ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad )
    {
        
        int mainViewWidth = [UIScreen mainScreen].bounds.size.width-16;
        int ViewWidth=(mainViewWidth-3*8)/4;
        int ViewHeight= (int)(ViewWidth+30);
        size= CGSizeMake(ViewWidth, ViewHeight);
        
        
    }
    else{
        int mainViewWidth = [UIScreen mainScreen].bounds.size.width-16;
        int ViewWidth=(mainViewWidth-8)/2;
        int ViewHeight= (int)(ViewWidth+30);
        size= CGSizeMake(ViewWidth, ViewHeight);
        
    }
    
    return size;
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    
    
    
    if(currentArray.count<=0)
    {
        
        dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            NSError *error;
            NSString *url_string = [NSString stringWithFormat: @"http://beta.propertyqueen.com.my/AppService/GetAllAgentForHomePage"];
            NSData *data = [NSData dataWithContentsOfURL: [NSURL URLWithString:url_string]];
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
            NSLog(@"%@",json);
            if(error==nil)
            {
                
                self->currentArray=[json objectForKey:@"AgentPlusList"];
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self->collectionViewForSeventhPage reloadData];
                });
                
            }
        });
    }
    
    
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return   currentArray.count;
}



- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    NSString *link=@"https://www.propertyqueen.com.my/";
    
    NSString* paths = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory,
                                                           NSUserDomainMask,
                                                           YES) lastObject];
    
    
    CellContainerCollectionViewCell  *cell = (CellContainerCollectionViewCell*)[collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.imageView.image=[UIImage imageNamed:@"placeholder.png"];
    
    NSDictionary *dic;
    UIImage *img;
    NSString *areaName;
    if((int)currentArray.count>0)
    {
        dic=currentArray[indexPath.row];
      
      
    }
   
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:[link stringByAppendingString:[dic objectForKey:@"ThumbUrl"]]]
                      placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
    
    [cell.label setFont:[UIFont boldSystemFontOfSize:12]];
    cell.label.adjustsFontSizeToFitWidth = NO;
    cell.label.numberOfLines = 0;
    cell.label.text=[[dic objectForKey:@"FirstName"] stringByAppendingString:[NSString stringWithFormat:@"%@%@",@" ",[dic objectForKey:@"lastName"]]];
    
    
    
    cell.label1.text=[dic objectForKey:@"Name"];
    [cell.label1 setFont:[UIFont systemFontOfSize:12]];
    cell.label1.adjustsFontSizeToFitWidth = NO;
    cell.label1.numberOfLines = 0;
    
    
    [cell.label2 setFont:[UIFont systemFontOfSize:12]];
    cell.label2.adjustsFontSizeToFitWidth = NO;
    cell.label2.numberOfLines = 0;
    
    cell.contentView.layer.cornerRadius = 2.0f;
    cell.contentView.layer.borderWidth = 1.0f;
    cell.contentView.layer.borderColor = [UIColor clearColor].CGColor;
    cell.contentView.layer.masksToBounds = YES;
    
    cell.layer.shadowColor = [UIColor lightGrayColor].CGColor;
    cell.layer.shadowOffset = CGSizeMake(0, 2.0f);
    cell.layer.shadowRadius = 2.0f;
    cell.layer.shadowOpacity = 1.0f;
    cell.layer.masksToBounds = NO;
    cell.layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:cell.bounds cornerRadius:cell.contentView.layer.cornerRadius].CGPath;
    
    return cell;
    
    
}
-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:YES];
    
}

- (void)collectionView:(UICollectionView *)collectionView
didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
}
    
    

@end
