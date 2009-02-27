//
//  AppDelegatrrific.m
//  EditorrificView
//
//  Created by Adrian on 2/27/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "AppDelegatrrific.h"
#import "Controller.h"

@implementation AppDelegatrrific

- (void)applicationDidFinishLaunching:(UIApplication *)application 
{
    [window addSubview:controller.view];
    [window makeKeyAndVisible];
}

- (void)dealloc 
{
    [controller release];
    [window release];
    [super dealloc];
}

@end
