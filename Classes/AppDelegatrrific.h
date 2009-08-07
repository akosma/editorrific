//
//  AppDelegatrrific.h
//  EditorrificView
//
//  Created by Adrian on 2/27/09.
//  Copyright akosma software 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Controller;

@interface AppDelegatrrific : NSObject <UIApplicationDelegate> 
{
@private
    IBOutlet Controller *_controller;
    IBOutlet UIWindow *_window;
}

@end

