//
//  Controller.m
//  EditorrificView
//
//  Created by Adrian on 2/27/09.
//  Copyright 2009 akosma software. All rights reserved.
//

#import "Controller.h"

@implementation Controller

#pragma mark -
#pragma mark Initialization and cleanup

- (void)viewDidLoad 
{
    _editorView.frame = CGRectMake(0.0, 128.0, 320.0, 116.0);
    _hidingTransformation = CGAffineTransformMakeTranslation(0.0, 350.0);    
    _editorView.transform = _hidingTransformation;
    [self.view addSubview:_editorView];
    _oldTextHeight = 0.0;
}

- (void)dealloc 
{
    [super dealloc];
}

#pragma mark -
#pragma mark IBAction methods

- (IBAction)edit:(id)sender
{
    [_editorTextView becomeFirstResponder];
    _editorTextView.text = _blockedTextView.text;
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:0.3];
    _editorView.transform = CGAffineTransformIdentity;
	[UIView commitAnimations];
}

- (IBAction)cancel:(id)sender
{
    [_editorTextView resignFirstResponder];
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:0.3];
    _editorView.transform = _hidingTransformation;
	[UIView commitAnimations];    
}

- (IBAction)done:(id)sender
{
    [self cancel:nil];
    _blockedTextView.text = _editorTextView.text;
    [self clear:nil];
}

- (IBAction)clear:(id)sender
{
    _editorTextView.text = @"";
}

#pragma mark -
#pragma mark UITextViewDelegate methods

- (void)textViewDidEndEditing:(UITextView *)textView
{
    [self cancel:nil];
}

- (void)textViewDidChange:(UITextView *)textView
{
    UIFont *font = [UIFont fontWithName:@"Helvetica" size:17.0];
    struct CGSize size = [_editorTextView.text sizeWithFont:font
                          constrainedToSize:CGSizeMake(280.0, 4000) 
                          lineBreakMode:UILineBreakModeWordWrap];
    CGFloat height = (size.height == 0.0) ? 21.0 : size.height;

    if (height != _oldTextHeight)
    {
        _hidingTransformation = CGAffineTransformMakeTranslation(0.0, 350.0 + height);
        _editorView.frame = CGRectMake(0.0, 149.0 - height, 320.0, 95.0 + height);
        _oldTextHeight = height;
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
