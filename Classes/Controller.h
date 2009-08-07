//
//  Controller.h
//  EditorrificView
//
//  Created by Adrian on 2/27/09.
//  Copyright 2009 akosma software. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Controller : UIViewController <UITextViewDelegate>
{
@private
    IBOutlet UIView *_editorView;
    IBOutlet UITextView *_editorTextView;
    IBOutlet UITextView *_blockedTextView;

    CGFloat _oldTextHeight;
    CGAffineTransform _hidingTransformation;
}

- (IBAction)edit:(id)sender;
- (IBAction)done:(id)sender;
- (IBAction)cancel:(id)sender;
- (IBAction)clear:(id)sender;

@end
