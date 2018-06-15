//
//  ThirdPageViewController.m
//  PopertyQueenMalaysia
//
//  Created by MacBook Pro Retina on 30/4/18.
//  Copyright © 2018 MacBook Pro Retina. All rights reserved.
//

#import "ThirdPageViewController.h"
#import "CellContainerCollectionViewCell.h"

@interface ThirdPageViewController ()

@end

@implementation ThirdPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    CGSize size;
    
    if ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad )
    {
        
        int mainViewWidth = [UIScreen mainScreen].bounds.size.width-16;
        int ViewWidth=(mainViewWidth-3*8)/4;
        int ViewHeight= (int)(ViewWidth+26);
        size= CGSizeMake(ViewWidth, ViewHeight);
        
        
    }
    else{
        int mainViewWidth = [UIScreen mainScreen].bounds.size.width-16;
        int ViewWidth=(mainViewWidth-8)/2;
        int ViewHeight= (int)(ViewWidth+26);
        size= CGSizeMake(ViewWidth, ViewHeight);
        
    }
    
    return size;
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return  16;
}



- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    CellContainerCollectionViewCell  *cell = (CellContainerCollectionViewCell*)[collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    NSString* name=@"";
    name=[name stringByAppendingString:[NSString stringWithFormat:@"%@%ld%@",@"image",(long)indexPath.row,@".jpg"]];
    cell.imageView.image=[UIImage imageNamed:name];
    cell.label.text=name;
    
    
    
    return cell;
}




@end
