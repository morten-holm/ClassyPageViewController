//
//  main.m
//  ClassyPageViewController
//
//  Created by Morten Holm on 14/03/14.
//  Copyright (c) 2014 Morten Holm. All rights reserved.
//

#import "AppDelegate.h"
#import <CASUtilities.h>
#import <CASStyler.h>

int main(int argc, char * argv[])
{
    @autoreleasepool {
        [CASStyler defaultStyler].filePath = [[NSBundle mainBundle] pathForResource:@"MainStyles.cas" ofType:nil];

#if TARGET_IPHONE_SIMULATOR
        NSString *filePath = @"MainStyles.cas";
        NSString *absoluteFilePath = CASAbsoluteFilePath(filePath);
        [CASStyler defaultStyler].watchFilePath = absoluteFilePath;
#endif
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }

}