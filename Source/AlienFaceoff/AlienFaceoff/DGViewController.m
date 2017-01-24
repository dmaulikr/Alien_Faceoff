

#import "DGViewController.h"
#import <AVFoundation/AVFoundation.h>

//If you need hide banner set 0
#define SHOW_IAD_BANNER 1
//Size of object
#define BUTTON_SIZE_WEIGHT 30
#define BUTTON_SIZE_HEIGHT 15
#define SUN_SIZE 70
#define PLAYER_SIZE_WEIGHT 50
#define PLAYER_SIZE_HEIGHT 70
#define LOGO_SIZE 60

@interface DGViewController ()

@end

AVAudioPlayer *audioplayer;
MPMoviePlayerController *mpc;

@implementation DGViewController





@synthesize logoGame, sunTexture, player1Image, iAdBanner;
@synthesize buttonSetting, buttonSingle, buttonTwoPlayer;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //Init DGInterfaceCount class
    interfaceCount = [[DGInterfaceCount alloc] init];
    //Init DGSound class
    sound = [[DGSound alloc] init];
    //Setting view
    [self settingView];
    //Find nill skin
    [self findNilSkin];
    //Play sound;
    [self playSound];
    //Animate Front Page Images
    image.animationImages = [NSArray arrayWithObjects:
                             [UIImage imageNamed:@"00000.png"],
                             [UIImage imageNamed:@"00002.png"],
                             [UIImage imageNamed:@"00003.png"],
                             nil];
    [image setAnimationRepeatCount:-1];
    image.animationDuration = 2;
    [image startAnimating];
 
}

#pragma mark Interface

-(void)settingView{
    //Set size to objects
    buttonSingle.frame = CGRectMake(0, 0, [interfaceCount getViewSizeWidthPersent:BUTTON_SIZE_WEIGHT andView:self.view.frame.size], [interfaceCount getViewSizeWidthPersent:BUTTON_SIZE_HEIGHT andView:self.view.frame.size]);
    buttonTwoPlayer.frame = CGRectMake(0, 0, [interfaceCount getViewSizeWidthPersent:BUTTON_SIZE_WEIGHT andView:self.view.frame.size], [interfaceCount getViewSizeWidthPersent:BUTTON_SIZE_HEIGHT andView:self.view.frame.size]);
    buttonSetting.frame = CGRectMake(0, 0, [interfaceCount getViewSizeWidthPersent:BUTTON_SIZE_WEIGHT andView:self.view.frame.size], [interfaceCount getViewSizeWidthPersent:BUTTON_SIZE_HEIGHT andView:self.view.frame.size]);
    sunTexture.frame = CGRectMake(0, 0, [interfaceCount getViewSizeWidthPersent:SUN_SIZE andView:self.view.frame.size], [interfaceCount getViewSizeWidthPersent:SUN_SIZE andView:self.view.frame.size]);
    player1Image.frame = CGRectMake(0, 0, [interfaceCount getViewSizeWidthPersent:PLAYER_SIZE_WEIGHT andView:self.view.frame.size], [interfaceCount getViewSizeWidthPersent:PLAYER_SIZE_HEIGHT andView:self.view.frame.size]);
    logoGame.frame = CGRectMake(0, 0, [interfaceCount getViewSizeWidthPersent:LOGO_SIZE andView:self.view.frame.size], [interfaceCount getViewSizeWidthPersent:LOGO_SIZE / 2 andView:self.view.frame.size]);
    
    //Set position of objects
    buttonSingle.layer.position = CGPointMake([interfaceCount getViewSizeWidthPersent:50 andView:self.view.frame.size], [interfaceCount getViewSizeHeightPersent:40 andView:self.view.frame.size]);
    buttonTwoPlayer.layer.position = CGPointMake([interfaceCount getViewSizeWidthPersent:50 andView:self.view.frame.size], [interfaceCount getViewSizeHeightPersent:50 andView:self.view.frame.size]);
    buttonSetting.layer.position = CGPointMake([interfaceCount getViewSizeWidthPersent:50 andView:self.view.frame.size], [interfaceCount getViewSizeHeightPersent:60 andView:self.view.frame.size]);
    sunTexture.layer.position = CGPointMake([interfaceCount getViewSizeWidthPersent:90 andView:self.view.frame.size], [interfaceCount getViewSizeHeightPersent:10 andView:self.view.frame.size]);
    player1Image.layer.position = CGPointMake([interfaceCount getViewSizeWidthPersent:80 andView:self.view.frame.size], [interfaceCount getViewSizeHeightPersent:80 andView:self.view.frame.size]);
    logoGame.layer.position = CGPointMake([interfaceCount getViewSizeWidthPersent:50 andView:self.view.frame.size], [interfaceCount getViewSizeHeightPersent:20 andView:self.view.frame.size]);
    
    

}

//Hide status bar
- (BOOL)prefersStatusBarHidden {
    return YES;
}

#pragma mark Change View

-(void)changeViewWithSingleMode:(BOOL)singleMode{
    //View gameView with single mode
    if (singleMode) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"gameModeSingle"];
    }
    //And two player mode
    else {
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"gameModeSingle"];
    }
    
    //View scene
    DGGameController *gameController = [self.storyboard instantiateViewControllerWithIdentifier:@"Game"];
    [self presentViewController:gameController animated:YES completion:nil];
}

-(void)changeViewToSetting{
    //View setting scene
    DGSettingsController *settingController = [self.storyboard instantiateViewControllerWithIdentifier:@"Setting"];
    [self presentViewController:settingController animated:YES completion:nil];
}

#pragma mark Game

-(void)findNilSkin{
    //If player1Skin and player2Skin is equal to nil set first skin
    if (![[NSUserDefaults standardUserDefaults] integerForKey:@"player1Skin"]) {
        [[NSUserDefaults standardUserDefaults] setInteger:1 forKey:@"player1Skin"];
        NSLog(@"Set skin 1 to one player");
    }
    if (![[NSUserDefaults standardUserDefaults] integerForKey:@"player2Skin"]) {
        [[NSUserDefaults standardUserDefaults] setInteger:1 forKey:@"player2Skin"];
        NSLog(@"Set skin 1 to second player");
    }
}

#pragma mark Actions

- (IBAction)buttonSingleUp:(id)sender {
    [self changeViewWithSingleMode:YES];
    [sound playButtonSound];
}

- (IBAction)buttonTwoPlayerUp:(id)sender{
    [self changeViewWithSingleMode:NO];
    [sound playButtonSound];
}

- (IBAction)buttonSettingUp:(id)sender {
    [self changeViewToSetting];
    [sound playButtonSound];
}



- (IBAction)tutorial:(id)sender {
    
    NSString *stringPath = [[NSBundle mainBundle]pathForResource:@"sample_sorenson 2" ofType:@"mov"];
    NSURL *url = [NSURL fileURLWithPath:stringPath];
    
    mpc=[[MPMoviePlayerController alloc]initWithContentURL:url];
    [mpc setMovieSourceType:MPMovieSourceTypeFile];
    
    [[self view]addSubview:mpc.view];
    [mpc setFullscreen:YES];
    [mpc play];
    
}




- (void)playSound{
 NSURL *url;
 
url= [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/mainSound.mp3", [[NSBundle mainBundle] resourcePath]]];

NSError *error;
    audioplayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    audioplayer.numberOfLoops = 0;
    NSString *myErr=@"Error";
    if (audioplayer == nil)
        NSLog(@"%@",myErr);
    else
    { [audioplayer play];
    audioplayer.numberOfLoops = -1;
    }
               }
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear: animated];
    
    audioplayer.delegate = nil;
    [audioplayer stop];
    audioplayer = nil;

}



@end
