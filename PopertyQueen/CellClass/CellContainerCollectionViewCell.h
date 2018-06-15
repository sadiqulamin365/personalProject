//
//  CellContainerCollectionViewCell.h
//  PopertyQueenApp
//
//  Created by MacBook Pro Retina on 28/4/18.
//  Copyright © 2018 MacBook Pro Retina. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CellContainerCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIView *containerView;

@property (weak, nonatomic) IBOutlet UILabel *label1;

@property (weak, nonatomic) IBOutlet UILabel *label2;


@end
