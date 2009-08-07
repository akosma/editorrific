//
//  AppDelegatrrific.m
//  EditorrificView
//
//  Created by Adrian on 2/27/09.
//  Copyright akosma software 2009. All rights reserved.
//

#import "AppDelegatrrific.h"
#import "Controller.h"

@implementation AppDelegatrrific

- (void)applicationDidFinishLaunching:(UIApplication *)application 
{
    [_window addSubview:_controller.view];
    [_window makeKeyAndVisible];
}

- (void)dealloc 
{
    [_controller release];
    [_window release];
    [super dealloc];
}

@end
