//
//  FirstViewController.m
//  Crashy4
//
//  Created by Misha Yurasov on 9/27/15.
//  Copyright (c) 2015 Misha Yurasov. All rights reserved.
//

#import "FirstViewController.h"
#import <AppPulseMobile/HPAppPulse.h>

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)throwCustomException {
    @throw [[NSException alloc] initWithName:@"Custom" reason:@"Testing" userInfo:nil];
}

- (IBAction)onButton1Tap:(id)sender {
    @try{
        [self throwCustomException];
    }
    @catch (NSException *ex){ [HPAppPulse reportCrash: ex];
        exit(1);
    }
}


- (IBAction)onButton2Tap:(id)sender {
    
    [HPAppPulse addBreadcrumb:@"BREADCRUMB at button tapped"];
    
    @try{
        [self throwCustomException];
    }
    @catch (NSException *ex){
        
        [HPAppPulse reportHandledException: ex];
    }
}


@end
