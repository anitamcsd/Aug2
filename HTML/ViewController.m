//
//  ViewController.m
//  HTML
//
//  Created by NYU User on 12/19/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (id) initWithNibName: (NSString *) nibNameOrNil bundle: (NSBundle *) nibBundleOrNil
{
	self = [super initWithNibName: nibNameOrNil bundle: nibBundleOrNil];
	if (self) {
		// Custom initialization
	}
	return self;
}

- (void) didReceiveMemoryWarning
{
	// Releases the view if it doesn't have a superview.
	[super didReceiveMemoryWarning];

	// Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Create a view hierarchy programmatically, without using a nib.
- (void) loadView
{/*
    NSString *html =
    @"<HTML>"
    "<HEAD>"
    "<META NAME = \"viewport\" CONTENT = \"width = device-width\">"
    "<STYLE TYPE = \"text/css\">"
    "<!--"
    "SPAN.big  {font-size: 125%; font-weight: bold; padding: .33em;}"
    "A:link    {font-size:  75%; color: white; text-decoration: none;}"
    "A:visited {font-size:  75%; color: white; text-decoration: none;}"
    "-->"
    "</STYLE>"
    "</HEAD>"
    
    "<BODY STYLE = \"background-color: yellow; margin: 0px;\">"
    
    "<TABLE STYLE = \""
    "\tcolor: white;"
    "\tfont: medium/200% Helvetica, sans serif;"
    "\tmargin: auto;"
    "\text-shadow: black .2em .2em 0;"
    "\">"
    
    "<TR>"
    "<TD ALIGN = \"CENTER\" COLSPAN = \"2\""
    "STYLE = \"padding-top: 7em; padding-bottom: 5em;\">"
    "THE FOLLOWING"
    "<SPAN CLASS = \"big\">PREVIEW</SPAN>"
    "HAS BEEN APPROVED FOR"
    "<BR><SPAN CLASS = \"big\">ALL AUDIENCES</SPAN>"
    "<BR>BY THE MOTION PICTURE ASSOCIATION OF AMERICA, INC."
    "</TD>"
    "</TR>"
    
    "<TR>"
    "<TD ALIGN = \"LEFT\">"
    "<A HREF = \"http://www.filmratings.com/\">www.filmratings.com</A>"
    "</TD>"
    ""
    "<TD ALIGN = \"RIGHT\">"
    "<A HREF = \"http://www.mpaa.org/\">www.mpaa.org</A>"
    "</TD>"
    "</TR>"
    "</TABLE>"
    ""
    "</BODY>"
    "</HTML>";
    */
    
    
    UIWebView *webView =
    [[UIWebView alloc] initWithFrame: [UIScreen mainScreen].applicationFrame];
	webView.scalesPageToFit = YES;	//Can user zoom in and out?
	webView.contentMode = UIViewContentModeRedraw;

    NSBundle *bundle = [NSBundle mainBundle];
    
    NSString *fileName =
    [bundle pathForResource: @"preview" ofType: @"html"];
    
    NSError *error = nil;
    NSString *html = [NSString stringWithContentsOfFile: fileName
                                               encoding: NSUTF8StringEncoding
                                                  error: &error
                      ];
    
    if (html == nil) {
        NSLog(@"error == %@", error);
        return ;
    }
    
    [webView loadHTMLString: html baseURL: nil];    

     
    /*
    
	NSURL *url = [NSURL URLWithString: @"http://i5.nyu.edu/~mm64/INFO1-CE9236/src/html/preview.html"];
	NSData *data = [NSData dataWithContentsOfURL: url];
	if (data == nil) {
		NSLog(@"could not load URL %@", url);
		return;
	}

	//No reason to create the UIWebView if we couldn't create the NSData.
	UIWebView *webView =
		[[UIWebView alloc] initWithFrame: [UIScreen mainScreen].applicationFrame];
	webView.scalesPageToFit = NO;	//Can user zoom in and out?
	webView.contentMode = UIViewContentModeRedraw;

	[webView loadData: data
		MIMEType: @"text/html"
		textEncodingName: @"NSUTF8StringEncoding"
		baseURL: url
	];
     */

	webView.alpha = 0;
	self.view = webView;
}


// Do additional setup after loading the view, typically from a nib.
- (void) viewDidLoad
{
	[super viewDidLoad];

	//Fade in the green band.
	[UIView animateWithDuration: 2
		delay: 1
		options: UIViewAnimationOptionCurveEaseInOut
		animations: ^{
			self.view.alpha = 1;
		}
		completion: NULL
	];
}


- (void) viewDidUnload
{
	[super viewDidUnload];
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (BOOL) shouldAutorotateToInterfaceOrientation: (UIInterfaceOrientation) interfaceOrientation
{
	// Return YES for supported orientations
	return interfaceOrientation == UIInterfaceOrientationLandscapeLeft;
}

@end
