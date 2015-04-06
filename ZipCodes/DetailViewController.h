//
//  DetailViewController.h
//  ZipCodes
//
//  Created by Caleb Hicks on 4/5/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Zip.h"

@interface DetailViewController : UIViewController

@property (strong, nonatomic) Zip *zip;

@end
