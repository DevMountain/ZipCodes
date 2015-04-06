//
//  ViewController.m
//  ZipCodes
//
//  Created by Caleb Hicks on 4/5/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "ViewController.h"
#import "ZipCodeController.h"
#import "DetailViewController.h"

@interface ViewController () <UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"zipCell"];
    
    Zip *zip = [ZipCodeController sharedInstance].zipCodes[indexPath.row];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%ld %@, %@", (long)zip.zip, zip.city, zip.state];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [ZipCodeController sharedInstance].zipCodes.count;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    
    Zip *zip = [ZipCodeController sharedInstance].zipCodes[indexPath.row];
    
    DetailViewController *detailViewController = segue.destinationViewController;
    
    detailViewController.zip = zip;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
