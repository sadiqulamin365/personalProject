//
//  SixthPageViewController.m
//  PopertyQueenMalaysia
//
//  Created by MacBook Pro Retina on 1/5/18.
//  Copyright © 2018 MacBook Pro Retina. All rights reserved.
//

#import "SixthPageViewController.h"

@interface SixthPageViewController ()
{
    NSDictionary *animals;
    NSMutableArray *animalSectionTitles;
}

@end

@implementation SixthPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    animalSectionTitles=[[NSMutableArray alloc]init];
    animals = @{@"Poperty Queen Malaysia" : @[@"Poperty Listing Guide", @"Poperty Developers", @"Poperty Agencies",@"Poperty Agents",@"Poperty Queen Singapore",@"News and Articles",@"Tesco Store Shoplot For Lease"],
                @"Corporate Info" : @[@"About PopertyQueen", @"Poperty Queen Expo",@"Terms of Use",@"Privacy Policy",@"Contact Us",@"Login/Register"],
                
                
                @"Residential Poperties For Sale" : @[@"Bungalow/villa for sale", @"Apartement /Condo/Services For Sale",@"Terrace/ Link House For Sale",@"Semi Detached House For Sale",@"Residential Land For Sale"],
                @"Commercial Properties For Sale" : @[@"Shop/ Office For Sale",
                                                      @"Hotel/ Resort For Sale",
                                                      @"Commercial Land For Sale",
                                                      @"Industrial/ Factory For Sale",
                                                      @"Agricultural Land For Sale"],
                @"Properties For Sale" : @[
                         
                         @"Properties For Sale in Kuala Lumpur",
                         @"Properties For Sale in Selangor",
                         @"Properties For Sale in Penang",
                         @"Properties For Sale in Kedah",
                        @"Properties For Sale in Kelantan",
                         @"Properties For Sale in Negeri Sembilan",
                         @"Properties For Sale in Pahang",
                         @"Properties For Sale in Perak",
                         @"Properties For Sale in Sabah",
                         @"Properties For Sale in Johor",
                         @"Properties For Sale in Sarawak"],
                
                @"Properties For Rent" : @[
                        
                        @"Properties For Rent in Kuala Lumpur",
                        @"Properties For Rent in Selangor",
                        @"Properties For Rent in Penang",
                        @"Properties For Rent in Kedah",
                        @"Properties For Rent in Kelantan",
                        @"Properties For Rent in Negeri Sembilan",
                        @"Properties For Rent in Pahang",
                        @"Properties For Rent in Perak",
                        @"Properties For Rent in Sabah",
                        @"Properties For Rent in Johor",
                        @"Properties For Rent in Sarawak"],
                
                
                @"Residential Poperties For Rent" : @[@"Bungalow/villa for rent", @"Apartement /Condo/Services For rent",@"Terrace/ Link House For rent",@"Semi Detached House For Sale",@"Residential Land For rent"],
                
                
                
                @"New Projects" : @[@"New Projects in Kuala Lumpur",
                         @"New Projects in Selangor",
                         @"New Projects in Penang",
                         @"New Projects in Kedah",
                         @"New Projects in Kelantan",
                         @"New Projects in Negeri Sembilan",
                         @"New Projects in Pahang",
                         @"New Projects in Perak",
                         @"New Projects in Sabah",
                         @"New Projects in Johor",
                         @"New Projects in Sarawak"],
                
                @"Commercial Properties For Rent" : @[@"Shop/ Office For rent",
                                                      @"Hotel/ Resort For rent",
                                                      @"Commercial Land For rent",
                                                      @"Industrial/ Factory For rent",
                                                      @"Agricultural Land For rent"],
               };
  
    
    [animalSectionTitles addObject:@"Poperty Queen Malaysia"];
    [animalSectionTitles addObject: @"Corporate Info"];
    [animalSectionTitles addObject: @"Residential Poperties For Sale"];
    [animalSectionTitles addObject:@"Commercial Properties For Sale"];
    [animalSectionTitles addObject:@"Properties For Sale"];
    [animalSectionTitles addObject:@"Properties For Rent"];
    [animalSectionTitles addObject:@"Residential Poperties For Rent"];
    [animalSectionTitles addObject:@"New Projects"];
    [animalSectionTitles addObject:@"Commercial Properties For Rent"];
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return [animalSectionTitles count];
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [animalSectionTitles objectAtIndex:section];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    NSString *sectionTitle = [animalSectionTitles objectAtIndex:section];
    NSArray *sectionAnimals = [animals objectForKey:sectionTitle];
    return [sectionAnimals count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    // Configure the cell...
    NSString *sectionTitle = [animalSectionTitles objectAtIndex:indexPath.section];
    NSArray *sectionAnimals = [animals objectForKey:sectionTitle];
    NSString *animal = [sectionAnimals objectAtIndex:indexPath.row];
    cell.textLabel.text = animal;
    cell.textLabel.textColor=[UIColor whiteColor];
    cell.textLabel.textAlignment=NSTextAlignmentLeft;
 
    
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section
{
    
    view.tintColor = [UIColor clearColor];
    
   
    UITableViewHeaderFooterView *header = (UITableViewHeaderFooterView *)view;
    [header.textLabel setTextColor:[UIColor whiteColor]];
    
}
@end
