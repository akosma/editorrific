//
//  AppDelegatrrific.h
//  EditorrificView
//
//  Created by Adrian on 2/27/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Controller;

@interface AppDelegatrrific : NSObject <UIApplicationDelegate> 
{
@private
    IBOutlet Controller *controller;
    IBOutlet UIWindow *window;
}

@end

