//
//  Controller.m
//  EditorrificView
//
//  Created by Adrian on 2/27/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "Controller.h"

@implementation Controller

#pragma mark -
#pragma mark Initialization and cleanup

- (void)viewDidLoad 
{
    editorView.frame = CGRectMake(0.0, 128.0, 320.0, 116.0);
    hidingTransformation = CGAffineTransformMakeTranslation(0.0, 350.0);    
    editorView.transform = hidingTransformation;
    [self.view addSubview:editorView];
    oldTextHeight = 0.0;
}

- (void)dealloc 
{
    [super dealloc];
}

#pragma mark -
#pragma mark IBAction methods

- (IBAction)edit:(id)sender
{
    [editorTextView becomeFirstResponder];
    editorTextView.text = blockedTextView.text;
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:0.3];
    editorView.transform = CGAffineTransformIdentity;
	[UIView commitAnimations];
}

- (IBAction)cancel:(id)sender
{
    [editorTextView resignFirstResponder];
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:0.3];
    editorView.transform = hidingTransformation;
	[UIView commitAnimations];    
}

- (IBAction)done:(id)sender
{
    [self cancel:nil];
    blockedTextView.text = editorTextView.text;
    [self clear:nil];
}

- (IBAction)clear:(id)sender
{
    editorTextView.text = @"";
}

#pragma mark -
#pragma mark UITextViewDelegate methods

- (void)textViewDidChange:(UITextView *)textView
{
    UIFont *font = [UIFont fontWithName:@"Helvetica" size:17.0];
    struct CGSize size = [editorTextView.text sizeWithFont:font
                          constrainedToSize:CGSizeMake(280.0, 4000) 
                          lineBreakMode:UILineBreakModeWordWrap];
    CGFloat height = (size.height == 0.0) ? 21.0 : size.height;

    if (height != oldTextHeight)
    {
        hidingTransformation = CGAffineTransformMakeTranslation(0.0, 350.0 + height);
        editorView.frame = CGRectMake(0.0, 149.0 - height, 320.0, 95.0 + height);
        oldTextHeight = height;
    }
}

#pragma mark -
#pragma mark UIViewController overridden methods

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation 
{
    return NO;
}

- (void)didReceiveMemoryWarning 
{
    [super didReceiveMemoryWarning];
}

@end
