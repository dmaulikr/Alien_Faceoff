

#import "DGGameController.h"

//Size of object
#define BUTTON_SIZE_WEIGHT 30
#define BUTTON_SIZE_HEIGHT 15
#define PLAYER_SIZE_WEIGHT 25
#define PLAYER_SIZE_HEIGHT 35
#define SHOT_INDICATOR_SIZE 30
#define BUTTON_RESTART_SIZE 30
#define NEXT_LEVEL_SIZE 30
#define BACK_TEXTURE_SIZE 35
#define SUN_SIZE 50
#define WIN_LABEL_SIZE 30
#define BLASTER_SHOT_SIZE 50

@interface DGGameController ()

@end

@implementation DGGameController

@synthesize shotIndicator, sun, player1View, player2View, texture1PlayerOne, texture1PlayerSecond, texture2PlayerOne, texture2PlayerSecond, winLoseIndicator1Player, winLoseIndicator2Player, blasterShot;
@synthesize buttonBack, buttonPlayer1, buttonPlayer2, buttonRestart,nextLevel;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //Init DGInterfaceCount class
    interfaceCount = [[DGInterfaceCount alloc] init];
    //Init DGSound class
    sound = [[DGSound alloc] init];
    //Setting view
    [self settingView];
    score=0;
    [scoreLb setText:[NSString stringWithFormat:@"%d",score]];
    score2=0;
    [scoreLb2 setText:[NSString stringWithFormat:@"%d",score2]];
    
    
    [self startGame];
    
}

#pragma mark Interface

-(void)settingView{
    //Set size to objects
    buttonBack.frame = CGRectMake(0, 0, [interfaceCount getViewSizeWidthPersent:BUTTON_SIZE_WEIGHT andView:self.view.frame.size], [interfaceCount getViewSizeWidthPersent:BUTTON_SIZE_HEIGHT andView:self.view.frame.size]);
    player1View.frame = CGRectMake(0, 0, [interfaceCount getViewSizeWidthPersent:PLAYER_SIZE_WEIGHT andView:self.view.frame.size], [interfaceCount getViewSizeWidthPersent:PLAYER_SIZE_HEIGHT andView:self.view.frame.size]);
    player2View.frame = CGRectMake(0, 0, [interfaceCount getViewSizeWidthPersent:PLAYER_SIZE_WEIGHT andView:self.view.frame.size], [interfaceCount getViewSizeWidthPersent:PLAYER_SIZE_HEIGHT andView:self.view.frame.size]);
    shotIndicator.frame = CGRectMake(0, 0, [interfaceCount getViewSizeWidthPersent:SHOT_INDICATOR_SIZE andView:self.view.frame.size], [interfaceCount getViewSizeWidthPersent:SHOT_INDICATOR_SIZE andView:self.view.frame.size]);
    sun.frame = CGRectMake(0, 0, [interfaceCount getViewSizeWidthPersent:SUN_SIZE andView:self.view.frame.size], [interfaceCount getViewSizeWidthPersent:SUN_SIZE andView:self.view.frame.size]);
    winLoseIndicator1Player.frame = CGRectMake(0, 0, [interfaceCount getViewSizeWidthPersent:WIN_LABEL_SIZE andView:self.view.frame.size], [interfaceCount getViewSizeWidthPersent:WIN_LABEL_SIZE / 2 andView:self.view.frame.size]);
    winLoseIndicator2Player.frame = CGRectMake(0, 0, [interfaceCount getViewSizeWidthPersent:WIN_LABEL_SIZE andView:self.view.frame.size], [interfaceCount getViewSizeWidthPersent:WIN_LABEL_SIZE / 2 andView:self.view.frame.size]);
    buttonRestart.frame = CGRectMake(0, 0, [interfaceCount getViewSizeWidthPersent:BUTTON_RESTART_SIZE andView:self.view.frame.size], [interfaceCount getViewSizeWidthPersent:BUTTON_RESTART_SIZE andView:self.view.frame.size]);
    nextLevel.frame = CGRectMake(0, 0, [interfaceCount getViewSizeWidthPersent:NEXT_LEVEL_SIZE andView:self.view.frame.size], [interfaceCount getViewSizeWidthPersent:NEXT_LEVEL_SIZE andView:self.view.frame.size]);
    blasterShot.frame = CGRectMake(0, 0, [interfaceCount getViewSizeWidthPersent:BLASTER_SHOT_SIZE / 3 andView:self.view.frame.size], [interfaceCount getViewSizeHeightPersent:BLASTER_SHOT_SIZE andView:self.view.frame.size]);
    
    texture1PlayerOne.frame = CGRectMake(0, 0, [interfaceCount getViewSizeWidthPersent:BACK_TEXTURE_SIZE andView:self.view.frame.size], [interfaceCount getViewSizeWidthPersent:BACK_TEXTURE_SIZE / 2 andView:self.view.frame.size]);
    texture1PlayerSecond.frame = CGRectMake(0, 0, [interfaceCount getViewSizeWidthPersent:BACK_TEXTURE_SIZE andView:self.view.frame.size], [interfaceCount getViewSizeWidthPersent:BACK_TEXTURE_SIZE / 2 andView:self.view.frame.size]);
    texture2PlayerOne.frame = CGRectMake(0, 0, [interfaceCount getViewSizeWidthPersent:BACK_TEXTURE_SIZE andView:self.view.frame.size], [interfaceCount getViewSizeWidthPersent:BACK_TEXTURE_SIZE / 2 andView:self.view.frame.size]);
    texture2PlayerSecond.frame = CGRectMake(0, 0, [interfaceCount getViewSizeWidthPersent:BACK_TEXTURE_SIZE andView:self.view.frame.size], [interfaceCount getViewSizeWidthPersent:BACK_TEXTURE_SIZE / 2 andView:self.view.frame.size]);
    
    //Set position of objects
    buttonBack.layer.position = CGPointMake([interfaceCount getViewSizeWidthPersent:15 andView:self.view.frame.size], [interfaceCount getViewSizeHeightPersent:10 andView:self.view.frame.size]);
    player1View.layer.position = CGPointMake([interfaceCount getViewSizeWidthPersent:50 andView:self.view.frame.size], [interfaceCount getViewSizeHeightPersent:80 andView:self.view.frame.size]);
    player2View.layer.position = CGPointMake([interfaceCount getViewSizeWidthPersent:50 andView:self.view.frame.size], [interfaceCount getViewSizeHeightPersent:20 andView:self.view.frame.size]);
    shotIndicator.layer.position = CGPointMake([interfaceCount getViewSizeWidthPersent:50 andView:self.view.frame.size], [interfaceCount getViewSizeHeightPersent:50 andView:self.view.frame.size]);
    sun.layer.position = CGPointMake([interfaceCount getViewSizeWidthPersent:95 andView:self.view.frame.size], [interfaceCount getViewSizeHeightPersent:5 andView:self.view.frame.size]);
    winLoseIndicator1Player.layer.position = CGPointMake([interfaceCount getViewSizeWidthPersent:50 andView:self.view.frame.size], [interfaceCount getViewSizeHeightPersent:65 andView:self.view.frame.size]);
    winLoseIndicator2Player.layer.position = CGPointMake([interfaceCount getViewSizeWidthPersent:50 andView:self.view.frame.size], [interfaceCount getViewSizeHeightPersent:35 andView:self.view.frame.size]);
    buttonRestart.layer.position = CGPointMake([interfaceCount getViewSizeWidthPersent:50 andView:self.view.frame.size], [interfaceCount getViewSizeHeightPersent:50 andView:self.view.frame.size]);
    nextLevel.layer.position = CGPointMake([interfaceCount getViewSizeWidthPersent:50 andView:self.view.frame.size], [interfaceCount getViewSizeHeightPersent:50 andView:self.view.frame.size]);
    blasterShot.layer.position = CGPointMake([interfaceCount getViewSizeWidthPersent:50 andView:self.view.frame.size], [interfaceCount getViewSizeHeightPersent:50 andView:self.view.frame.size]);
    
    texture1PlayerOne.layer.position = CGPointMake([interfaceCount getViewSizeWidthPersent:25 andView:self.view.frame.size], [interfaceCount getViewSizeHeightPersent:75 andView:self.view.frame.size]);
    texture1PlayerSecond.layer.position = CGPointMake([interfaceCount getViewSizeWidthPersent:75 andView:self.view.frame.size], [interfaceCount getViewSizeHeightPersent:75 andView:self.view.frame.size]);
    texture2PlayerOne.layer.position = CGPointMake([interfaceCount getViewSizeWidthPersent:25 andView:self.view.frame.size], [interfaceCount getViewSizeHeightPersent:25 andView:self.view.frame.size]);
    texture2PlayerSecond.layer.position = CGPointMake([interfaceCount getViewSizeWidthPersent:75 andView:self.view.frame.size], [interfaceCount getViewSizeHeightPersent:25 andView:self.view.frame.size]);
    
    buttonPlayer1.frame = CGRectMake(0, self.view.frame.size.height / 2, self.view.frame.size.width, self.view.frame.size.height / 2);
    buttonPlayer2.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height / 2);
}

//Hide status bar
- (BOOL)prefersStatusBarHidden {
    return YES;
}

//Set random back texture image
-(void)setBackImages{
    texture1PlayerOne.image = [[UIImage alloc] initWithCGImage:[UIImage imageNamed:[interfaceCount returnRandomNameBackTexture]].CGImage scale:1.0 orientation:UIImageOrientationDown];
    texture1PlayerSecond.image = [[UIImage alloc] initWithCGImage:[UIImage imageNamed:[interfaceCount returnRandomNameBackTexture]].CGImage scale:1.0 orientation:UIImageOrientationDown];
    texture2PlayerOne.image = [UIImage imageNamed:[interfaceCount returnRandomNameBackTexture]];
    texture2PlayerSecond.image = [UIImage imageNamed:[interfaceCount returnRandomNameBackTexture]];
}

-(void)setPicturesOffPlayers{
    //Set skin of first player
    if ([[NSUserDefaults standardUserDefaults] integerForKey:@"player1Skin"] == 1) {
        player1Simple = [UIImage imageNamed:@"1simple"];
        player1Shot = [UIImage imageNamed:@"1shot"];
    }
    else if ([[NSUserDefaults standardUserDefaults] integerForKey:@"player1Skin"] == 2) {
        player1Simple = [UIImage imageNamed:@"2simple"];
        player1Shot = [UIImage imageNamed:@"2shot"];
    }
    else {
        player1Simple = [UIImage imageNamed:@"3simple"];
        player1Shot = [UIImage imageNamed:@"3shot"];
    }
    //If single mode set random second player skin
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"gameModeSingle"] == YES) {
        int random = arc4random() % 3;
        if (random == 0) {
            player2Simple = [UIImage imageNamed:@"1simple"];
            player2Shot = [UIImage imageNamed:@"1shot"];
        }
        else if (random == 1) {
            player2Simple = [UIImage imageNamed:@"2simple"];
            player2Shot = [UIImage imageNamed:@"2shot"];
        }
        else {
            player2Simple = [UIImage imageNamed:@"3simple"];
            player2Shot = [UIImage imageNamed:@"3shot"];
        }
    }
    //Set skin of second player
    else {
        if ([[NSUserDefaults standardUserDefaults] integerForKey:@"player2Skin"] == 1) {
            player2Simple = [UIImage imageNamed:@"1simple"];
            player2Shot = [UIImage imageNamed:@"1shot"];
        }
        else if ([[NSUserDefaults standardUserDefaults] integerForKey:@"player2Skin"] == 2) {
            player2Simple = [UIImage imageNamed:@"2simple"];
            player2Shot = [UIImage imageNamed:@"2shot"];
        }
        else {
            player2Simple = [UIImage imageNamed:@"3simple"];
            player2Shot = [UIImage imageNamed:@"3shot"];
        }
    }
    //Change orientation of first image
    player1Simple = [[UIImage alloc] initWithCGImage:player1Simple.CGImage scale:1.0 orientation:UIImageOrientationDown];
    player1Shot = [[UIImage alloc] initWithCGImage:player1Shot.CGImage scale:1.0 orientation:UIImageOrientationDown];
    //Set images to view
    player1View.image = player1Simple;
    player2View.image = player2Simple;
}

#pragma mark Game

//Start game method
-(void)startGame{
    //Set players skin
    [self setPicturesOffPlayers];
    //Change hidden on win labels
    [self changeHiddenStart:YES];
    //Set back images
    [self setBackImages];
    
    //Change hidden of object
    buttonPlayer1.hidden = NO;
    buttonPlayer2.hidden = NO;
    shotIndicator.hidden = YES;
    buttonRestart.hidden = YES;
    blasterShot.hidden = YES;
    nextLevel.hidden=YES;
    
    //Set standart stat
    shotOneCan = NO;
    gameContine = YES;
    
    //Hide button 2 if single mode game
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"gameModeSingle"] == YES){
        buttonPlayer2.hidden = YES;
    }
    
    //Set timer to show message to start shot
    float timeToGo = (arc4random() % 41 * 0.1) + 2;
    timerToShot = [NSTimer scheduledTimerWithTimeInterval:timeToGo target:self selector:@selector(timerToShotIsGo) userInfo:nil repeats:NO];
}

//End game method
-(void)endGame:(int)value{
    if (gameContine) {
        //Play shot sound
        [sound playShotSound];
        
        gameContine = NO;
        //Hide blaster timer
        timerBlasterShot = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(hideBlasterShot) userInfo:nil repeats:NO];
        
        //If player 1 win
        if (value == 1) {
            value1=value;
            if (flag==YES) {
                nextLevel.hidden = NO;
            } else {
                buttonRestart.hidden = NO;
            }
            player1View.image = player1Shot;
            blasterShot.image = [UIImage imageNamed:@"blasterFlash"];
            winLoseIndicator1Player.image = [UIImage imageNamed:@"winLabel"];
            winLoseIndicator2Player.image = [[UIImage alloc] initWithCGImage:[UIImage imageNamed:@"loseLabel"].CGImage scale:1.0 orientation:UIImageOrientationDown];
            
        }
        //If player 2 win
        else {
            buttonRestart.hidden = NO;            player2View.image = player2Shot;
            blasterShot.image = [[UIImage alloc] initWithCGImage:[UIImage imageNamed:@"blasterFlash"].CGImage scale:1.0 orientation:UIImageOrientationDown];
            winLoseIndicator1Player.image = [UIImage imageNamed:@"loseLabel"];
            winLoseIndicator2Player.image = [[UIImage alloc] initWithCGImage:[UIImage imageNamed:@"winLabel"].CGImage scale:1.0 orientation:UIImageOrientationDown];
        }
    }
    //Stop timers
    [self stopTimers];
    //Change hidden of objects
    blasterShot.hidden = NO;
    shotIndicator.hidden = YES;
    buttonPlayer1.hidden = YES;
    buttonPlayer2.hidden = YES;
}

//Change indicator hidden
-(void)changeHiddenStart:(BOOL)value{
    winLoseIndicator1Player.hidden = value;
    winLoseIndicator2Player.hidden = value;
}

//View restart view object
-(void)restartViewShow{
    [self changeHiddenStart:NO];
    
}

//View nextlevel view object
-(void)nextLevelViewShow{
    [self changeHiddenStart:NO];
    nextLevel.hidden = NO;
}



#pragma mark Timers

//Time to start shot is go
-(void)timerToShotIsGo{
    //View indicator
    shotIndicator.hidden = NO;
    shotOneCan = YES;
    
    //If game mode single cound opponent shot time
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"gameModeSingle"] == YES){
        flag=[[NSUserDefaults standardUserDefaults]boolForKey:@"gameModeSingle"];
        float shotTime = arc4random() % 11 * 0.1;
        if (shotTime < 0.2) { shotTime = 0.2;}
        
        timerToShot = [NSTimer scheduledTimerWithTimeInterval:shotTime target:self selector:@selector(shotSingleOpponent) userInfo:nil repeats:NO];
    }
    //Hide indicator
    timerToHideLabel = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(hideShotIndicator) userInfo:nil repeats:NO];
}

//Hide shot indicator
-(void)hideShotIndicator{
    shotIndicator.hidden = YES;
}

//If single mode shot oppenent
-(void)shotSingleOpponent{
    if (shotOneCan == YES) {
        [self endGame:2];
    }
    else {
        [self endGame:1];
    }
}

//Hide blaster shot
-(void)hideBlasterShot{
    blasterShot.hidden = YES;
    //And view restart view objects
    [self restartViewShow];
}



//Stop timers
-(void)stopTimers{
    [timerToShot invalidate];
    [timerToHideLabel invalidate];
    [timerOppenentShot invalidate];
}

#pragma mark Change View

-(void)changeViewToSetting{
    //View menu scene
    DGViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"Menu"];
    [self presentViewController:viewController animated:YES completion:nil];
}

#pragma mark Actions

- (IBAction)buttonBack:(id)sender {
    [self changeViewToSetting];
    [sound playButtonSound];
}

- (IBAction)buttonPlayer1Shot:(id)sender {
    if (shotOneCan == YES) {
        [self endGame:1];
    }
    else {
        [self endGame:2];
    }
}

- (IBAction)buttonPlayer2Shot:(id)sender {
    if (shotOneCan == YES) {
        [self endGame:2];
    }
    else {
        [self endGame:1];
    }
}

- (IBAction)buttonRestartUp:(id)sender {
    if (flag==YES) {
        score2=score2+1;
        [scoreLb2 setText:[NSString stringWithFormat:@"%d",score2]];
    } else
    {
        if (value1==1) {
            score=score+1;
            [scoreLb setText:[NSString stringWithFormat:@"%d",score]];
        } else {
            score2=score2+1;
            [scoreLb2 setText:[NSString stringWithFormat:@"%d",score2]];
        }
    }
    [self startGame];

   
    [sound playButtonSound];
}

- (IBAction)nextLevelUp:(id)sender {
    [self startGame];
    score=score+1;
    [scoreLb setText:[NSString stringWithFormat:@"%d",score]];
    
    [sound playButtonSound];
}

@end
