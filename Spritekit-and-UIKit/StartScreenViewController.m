//
//  ViewController.m
//  Spritekit-and-UIKit
//
//  Created by Natalie Coulam on 23/09/16.
//  Copyright © 2016 Natalie Coulam. All rights reserved.
//

#import "StartScreenViewController.h"
//   Include the GameKit framework
#import <GameKit/GameKit.h>
#import "User.h"

static NSString* const kAvatar = @"http://afarber.de/gc/%@.jpg";
static NSString* const kScript = @"http://afarber.de/gc-upload.php";
static NSString* const kBody   = @"id=%@&img=%@";

NSString *const PLAYER_ID = @"playerId";
NSString *const RANDOM_NUMBER = @"randomNumber";
NSString *const AUTHENTICATED_NOTIFICATION = @"AUTHENTICATED_NOTIFICATION";
NSString *const UNAUTHENTICATED_NOTIFICATION = @"UNAUTHENTICATED_NOTIFICATION";

@interface StartScreenViewController ()
{
     User* _user;
}

@end

@implementation StartScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
      [self fetchUser];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}


//
//Reference Name	Leaderboard ID	Type	Default	Status
//MyDemoLeaderboard	My_Demo_Leaderboard	Single	Default	Not Live


//Reference Name	Achievement ID	Points	Status
//Achievement50Points	Achievement_50Points	50	Not Live


- (void)loadAvatar:(GKPlayer*)player
{
    [player loadPhotoForSize:GKPhotoSizeNormal withCompletionHandler:^(UIImage *photo, NSError *error) {
        
        if (error ==nil) {
            _imageView.image = photo;
        }
        else
        {
            NSLog(@"an error occured loading player avatar %@",[error localizedDescription]);
        }
//        if (error) {
//            [self showAlert:error.description];
//            //return;
//        }
//        
//        if (photo) {
//            _imageView.image = photo;
//            [self uploadImage:photo];
//        }
   }];
}

//- (void)uploadImage:(UIImage*)img
//{
//    NSLog(@"Upload user image");
//    NSData* data = UIImageJPEGRepresentation(img, .8);
//    NSString* str = [data base64EncodedStringWithOptions:0];
//    //NSLog(@"%s: img=%@ data=%@", __PRETTY_FUNCTION__, img, str);
//    
//    NSURL *url = [NSURL URLWithString:kScript];
//    NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:url];
//    [req setTimeoutInterval:30.0f];
//    [req setHTTPMethod:@"POST"];
//    
//    NSString *body = [NSString stringWithFormat:kBody,
//                      [self urlencode:_user.userId],
//                      [self urlencode:str]];
//    [req setHTTPBody:[body dataUsingEncoding:NSUTF8StringEncoding]];
//    
//    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
//    
//    [NSURLConnection sendAsynchronousRequest:req
//                                       queue:queue
//                           completionHandler:^(NSURLResponse *response,
//                                               NSData *data,
//                                               NSError *error) {
//                               
//                               if ([data length] > 0 && error == nil) {
//                                   id json = [NSJSONSerialization JSONObjectWithData:data
//                                                                             options:NSJSONReadingMutableContainers
//                                                                               error:nil];
//                                   NSLog(@"JSON = %@", json);
//                               }
//                               else if ([data length] == 0 && error == nil) {
//                                   NSLog(@"Nothing was downloaded.");
//                               }
//                               else if (error != nil) {
//                                   NSLog(@"Error happened = %@", error);
//                               }
//                           }];
//}


//
- (NSString*)urlencode:(NSString*)str
{
    return (NSString*)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(
                                                                                NULL,
                                                                                (__bridge CFStringRef) str,
                                                                                NULL,
                                                                                CFSTR("+/:"),
                                                                                kCFStringEncodingUTF8));
}

- (void)showAlert:(NSString*)msg {
    dispatch_async(dispatch_get_main_queue(), ^(void) {
        UIAlertView *alertView = [[UIAlertView alloc]
                                  initWithTitle:@"WARNING"
                                  message:msg
                                  delegate:nil
                                  cancelButtonTitle:@"OK"
                                  otherButtonTitles:nil];
        [alertView show];
    });
}

- (void)fetchUser
{
    __weak GKLocalPlayer *localPlayer = [GKLocalPlayer localPlayer];
    localPlayer.authenticateHandler = ^(UIViewController *viewController, NSError *error) {
        
        assert([NSThread isMainThread]);
        
        if (viewController != nil) {
            [self presentViewController:viewController
                               animated:YES
                             completion:nil];
            
        } else if (localPlayer.isAuthenticated)
        {
            NSLog(@"(localPlayer.isAuthenticated @%@",localPlayer.displayName);
            //_aliasLabel.text = localPlayer.alias;
//            _idLabel.text    = localPlayer.playerID;
//            _playerId        = localPlayer.playerID;
            
          //  [self loadAvatar:localPlayer];
        }
        
        else
        {
           // [self showAlert:@"Game Center has been disabled."];
        }
        
        if (error)
        {
           // [self showAlert:error.description];
        }
        
    };
}

-(void)authenticatedPlayer
{
    GKLocalPlayer *localPlayer = [GKLocalPlayer localPlayer];
    [[NSNotificationCenter defaultCenter]postNotificationName:AUTHENTICATED_NOTIFICATION object:nil];
    NSLog(@"Local player:%@ authenticated into game center",localPlayer.playerID);
}

-(void)disableGameCenter
{
    //A notification so that every observer responds appropriately to disable game center features
    [[NSNotificationCenter defaultCenter]postNotificationName:UNAUTHENTICATED_NOTIFICATION object:nil];
    NSLog(@"Disabled game center");
}



@end
