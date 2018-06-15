//
//  OptionViewController.m
//  PopertyQueenMalaysia
//
//  Created by MacBook Pro Retina on 30/4/18.
//  Copyright © 2018 MacBook Pro Retina. All rights reserved.
//

#import "OptionViewController.h"

@interface OptionViewController ()
{
    NSMutableArray  *nameArray;
}

@end

@implementation OptionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    nameArray=[[NSMutableArray alloc]init];
    [nameArray addObject:@"LOGIN/SIGNUP"];
    [nameArray addObject:@"NEW"];
    [nameArray addObject:@"BUY"];
    [nameArray addObject:@"RENT"];
    [nameArray addObject:@"LANGUAGE"];
    [nameArray  addObject:@"FIND DEVELOPERS"];
    [nameArray addObject:@"FIND AGENCIES"];
    [nameArray addObject:@"WATCH VIDEO"];
    [nameArray addObject:@"TERMS OF USE"];
    [nameArray addObject:@"PRIVACY POLICY"];
    [nameArray addObject:@"CONTACT US"];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;    //count of section
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return nameArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    
    cell.textLabel.text = nameArray[indexPath.row];
    cell.textLabel.textColor=[UIColor whiteColor];
    cell.textLabel.textAlignment=NSTextAlignmentLeft;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
{
}

@end
