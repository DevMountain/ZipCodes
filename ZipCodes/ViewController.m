//
//  ViewController.m
//  ZipCodes
//
//  Created by Caleb Hicks on 4/5/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "ViewController.h"
#import "ZipCodeController.h"

@interface ViewController () <UITableViewDataSource>

@property (strong, nonatomic) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Zip Codes";

    self.tableView = [UITableView new];
    self.tableView.frame = self.view.frame;
    self.tableView.dataSource = self;
    
    [self.view addSubview:self.tableView];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"zipCell"];
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
