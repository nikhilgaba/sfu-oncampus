//
//  SFUWebViewController.m
//  SFU OnCampus
//
//  Created by Abram Wiebe on 2015-02-21.
//  Copyright (c) 2015 Simon Fraser University. All rights reserved.
//

#import "SFUWebViewController.h"

@implementation SFUWebViewController

-(void)viewDidLoad
{
   [ self.webView loadRequest: [NSURLRequest requestWithURL:self.startURL]];
    //   wv.delegate = self;
//#if TARGET_OS_IPHONE
//    self.completionHandlerDictionary = [NSMutableDictionary dictionaryWithCapacity:0];
//#endif
//    
//    /* Create some configuration objects. */
//    
//    NSURLSessionConfiguration *backgroundConfigObject = [NSURLSessionConfiguration backgroundSessionConfiguration: @"myBackgroundSessionIdentifier"];
//    NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
//    NSURLSessionConfiguration *ephemeralConfigObject = [NSURLSessionConfiguration ephemeralSessionConfiguration];
//    
//    
//    /* Configure caching behavior for the default session.
//     Note that iOS requires the cache path to be a path relative
//     to the ~/Library/Caches directory, but OS X expects an
//     absolute path.
//     */
//#if TARGET_OS_IPHONE
//    NSString *cachePath = @"/MyCacheDirectory";
//    
//    NSArray *myPathList = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
//    NSString *myPath    = [myPathList  objectAtIndex:0];
//    
//    NSString *bundleIdentifier = [[NSBundle mainBundle] bundleIdentifier];
//    
//    NSString *fullCachePath = [[myPath stringByAppendingPathComponent:bundleIdentifier] stringByAppendingPathComponent:cachePath];
//    NSLog(@"Cache path: %@\n", fullCachePath);
//#else
//    NSString *cachePath = [NSTemporaryDirectory() stringByAppendingPathComponent:@"/nsurlsessiondemo.cache"];
//    
//    NSLog(@"Cache path: %@\n", cachePath);
//#endif
//    
//    
//    
//    
//    
//    NSURLCache *myCache = [[NSURLCache alloc] initWithMemoryCapacity: 16384 diskCapacity: 268435456 diskPath: cachePath];
//    defaultConfigObject.URLCache = myCache;
//    defaultConfigObject.requestCachePolicy = NSURLRequestUseProtocolCachePolicy;
//    
//    /* Create a session for each configurations. */
//    self.defaultSession = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate: self delegateQueue: [NSOperationQueue mainQueue]];
}

-(void)displayPageForURLString:(NSString*)url
{
    NSURL* lurl = [NSURL URLWithString:url];
    [self displayPageForURL:lurl];
}

-(void)displayPageForURL:(NSURL*)url
{
    [self displayPageForURL:url inApp:YES];
}
-(void)displayPageForURL:(NSURL*)url inApp:(BOOL)showInApp
{
    //Web view is not available at this point so store the url to be used until the view is acutally loaded
    NSLog(@"Should display request");
    self.startURL = url;
    [ self.webView loadRequest: [NSURLRequest requestWithURL:self.startURL]];
    
}

-(void)prepareSocialList
{
    
}

-(void)prepareYoutubeList
{
    
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    NSLog(@"Error Loading page : %@",[error description]) ;
     if(!webView.isLoading)
     {
         self.title = @"Failed to load page";
     }
}
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    NSLog(@"startLoad");

}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    NSLog(@"finishLoad");
   self.title =[webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    
    if([webView canGoBack])
    {
        self.backButton.tintColor = [UIColor whiteColor];
        self.backButton.enabled=YES;
    }else
    {
        self.backButton.tintColor = [[UIColor blackColor] colorWithAlphaComponent:.5f];
        self.backButton.enabled=NO;
    }
    
    if([webView canGoForward])
    {
        self.forwardButton.tintColor = [UIColor whiteColor];
        self.forwardButton.enabled=YES;
    }else
    {
        self.forwardButton.tintColor=[[UIColor blackColor] colorWithAlphaComponent:.5f];
        self.forwardButton.enabled=NO;
    }

}
@end
