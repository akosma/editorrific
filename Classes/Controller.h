//
//  Controller.h
//  EditorrificView
//
//  Created by Adrian on 2/27/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Controller : UIViewController <UITextViewDelegate>
{
@private
    IBOutlet UIView *editorView;
    IBOutlet UITextView *editorTextView;
    IBOutlet UITextView *blockedTextView;

    CGFloat oldTextHeight;
    CGAffineTransform hidingTransformation;
}

- (IBAction)edit:(id)sender;
- (IBAction)done:(id)sender;
- (IBAction)cancel:(id)sender;
- (IBAction)clear:(id)sender;

@end
