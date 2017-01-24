

#import "DGSettingsController.h"

//Size of object
#define BUTTON_SIZE_WEIGHT 30
#define BUTTON_SIZE_HEIGHT 15
#define LABEL_SIZE 40
#define PLAYER_SIZE_WEIGHT 25
#define PLAYER_SIZE_HEIGHT 35
#define SELECT_SIZE 30

@interface DGSettingsController ()

@end
AVAudioPlayer *audioplayer;
@implementation DGSettingsController

@synthesize player1Label, player2Label, selectImagePlayer1, selectImagePlayer2, buttonBack, button1PlayerSkin1, button1PlayerSkin2, button1PlayerSkin3, button2PlayerSkin1, button2PlayerSkin2, button2PlayerSkin3;

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
    //Set select to position
    [self setSelectImagesToPosition];
}

#pragma mark Interface

-(void)settingView{
    //Set size to objects
    buttonBack.frame = CGRectMake(0, 0, [interfaceCount getViewSizeWidthPersent:BUTTON_SIZE_WEIGHT andView:self.view.frame.size], [interfaceCount getViewSizeWidthPersent:BUTTON_SIZE_HEIGHT andView:self.view.frame.size]);
    player1Label.frame = CGRectMake(0, 0, [interfaceCount getViewSizeWidthPersent:LABEL_SIZE andView:self.view.frame.size], [interfaceCount getViewSizeWidthPersent:LABEL_SIZE / 2 andView:self.view.frame.size]);
    player2Label.frame = CGRectMake(0, 0, [interfaceCount getViewSizeWidthPersent:LABEL_SIZE andView:self.view.frame.size], [interfaceCount getViewSizeWidthPersent:LABEL_SIZE / 2 andView:self.view.frame.size]);
    selectImagePlayer1.frame = CGRectMake(0, 0, [interfaceCount getViewSizeWidthPersent:SELECT_SIZE andView:self.view.frame.size], [interfaceCount getViewSizeWidthPersent:SELECT_SIZE / 2 andView:self.view.frame.size]);
    selectImagePlayer2.frame = CGRectMake(0, 0, [interfaceCount getViewSizeWidthPersent:SELECT_SIZE andView:self.view.frame.size], [interfaceCount getViewSizeWidthPersent:SELECT_SIZE / 2 andView:self.view.frame.size]);
    
    button1PlayerSkin1.frame = CGRectMake(0, 0, [interfaceCount getViewSizeWidthPersent:PLAYER_SIZE_WEIGHT andView:self.view.frame.size], [interfaceCount getViewSizeWidthPersent:PLAYER_SIZE_HEIGHT andView:self.view.frame.size]);
    button1PlayerSkin2.frame = CGRectMake(0, 0, [interfaceCount getViewSizeWidthPersent:PLAYER_SIZE_WEIGHT andView:self.view.frame.size], [interfaceCount getViewSizeWidthPersent:PLAYER_SIZE_HEIGHT andView:self.view.frame.size]);
    button1PlayerSkin3.frame = CGRectMake(0, 0, [interfaceCount getViewSizeWidthPersent:PLAYER_SIZE_WEIGHT andView:self.view.frame.size], [interfaceCount getViewSizeWidthPersent:PLAYER_SIZE_HEIGHT andView:self.view.frame.size]);
    button2PlayerSkin1.frame = CGRectMake(0, 0, [interfaceCount getViewSizeWidthPersent:PLAYER_SIZE_WEIGHT andView:self.view.frame.size], [interfaceCount getViewSizeWidthPersent:PLAYER_SIZE_HEIGHT andView:self.view.frame.size]);
    button2PlayerSkin2.frame = CGRectMake(0, 0, [interfaceCount getViewSizeWidthPersent:PLAYER_SIZE_WEIGHT andView:self.view.frame.size], [interfaceCount getViewSizeWidthPersent:PLAYER_SIZE_HEIGHT andView:self.view.frame.size]);
    button2PlayerSkin3.frame = CGRectMake(0, 0, [interfaceCount getViewSizeWidthPersent:PLAYER_SIZE_WEIGHT andView:self.view.frame.size], [interfaceCount getViewSizeWidthPersent:PLAYER_SIZE_HEIGHT andView:self.view.frame.size]);
    
    //Set position of objects
    buttonBack.layer.position = CGPointMake([interfaceCount getViewSizeWidthPersent:15 andView:self.view.frame.size], [interfaceCount getViewSizeHeightPersent:10 andView:self.view.frame.size]);
    player1Label.layer.position = CGPointMake([interfaceCount getViewSizeWidthPersent:50 andView:self.view.frame.size], [interfaceCount getViewSizeHeightPersent:15 andView:self.view.frame.size]);
    player2Label.layer.position = CGPointMake([interfaceCount getViewSizeWidthPersent:50 andView:self.view.frame.size], [interfaceCount getViewSizeHeightPersent:60 andView:self.view.frame.size]);
    
    button1PlayerSkin1.layer.position = CGPointMake([interfaceCount getViewSizeWidthPersent:25 andView:self.view.frame.size], [interfaceCount getViewSizeHeightPersent:30 andView:self.view.frame.size]);
    button1PlayerSkin2.layer.position = CGPointMake([interfaceCount getViewSizeWidthPersent:50 andView:self.view.frame.size], [interfaceCount getViewSizeHeightPersent:30 andView:self.view.frame.size]);
    button1PlayerSkin3.layer.position = CGPointMake([interfaceCount getViewSizeWidthPersent:75 andView:self.view.frame.size], [interfaceCount getViewSizeHeightPersent:30 andView:self.view.frame.size]);
    button2PlayerSkin1.layer.position = CGPointMake([interfaceCount getViewSizeWidthPersent:25 andView:self.view.frame.size], [interfaceCount getViewSizeHeightPersent:80 andView:self.view.frame.size]);
    button2PlayerSkin2.layer.position = CGPointMake([interfaceCount getViewSizeWidthPersent:50 andView:self.view.frame.size], [interfaceCount getViewSizeHeightPersent:80 andView:self.view.frame.size]);
    button2PlayerSkin3.layer.position = CGPointMake([interfaceCount getViewSizeWidthPersent:75 andView:self.view.frame.size], [interfaceCount getViewSizeHeightPersent:80 andView:self.view.frame.size]);
}

//Hide status bar
- (BOOL)prefersStatusBarHidden {
    return YES;
}

//Set position select on view
-(void)setSelectImagesToPosition{
    //Player 1 set
    if ([[NSUserDefaults standardUserDefaults] integerForKey:@"player1Skin"] == 1) {
        selectImagePlayer1.layer.position = CGPointMake(button1PlayerSkin1.frame.origin.x + button1PlayerSkin1.frame.size.width / 2, button1PlayerSkin1.frame.origin.y + (button2PlayerSkin3.frame.size.height / 10) * 8);
    }
    else if ([[NSUserDefaults standardUserDefaults] integerForKey:@"player1Skin"] == 2) {
        selectImagePlayer1.layer.position = CGPointMake(button1PlayerSkin2.frame.origin.x + button1PlayerSkin1.frame.size.width / 2, button1PlayerSkin2.frame.origin.y + (button2PlayerSkin3.frame.size.height / 10) * 8);
    }
    else {
        selectImagePlayer1.layer.position = CGPointMake(button1PlayerSkin3.frame.origin.x + button1PlayerSkin1.frame.size.width / 2, button1PlayerSkin3.frame.origin.y + (button2PlayerSkin3.frame.size.height / 10) * 8);
    }
    //Player 2 set
    if ([[NSUserDefaults standardUserDefaults] integerForKey:@"player2Skin"] == 1) {
        selectImagePlayer2.layer.position = CGPointMake(button2PlayerSkin1.frame.origin.x + button1PlayerSkin1.frame.size.width / 2, button2PlayerSkin1.frame.origin.y + (button2PlayerSkin3.frame.size.height / 10) * 8);
    }
    else if ([[NSUserDefaults standardUserDefaults] integerForKey:@"player2Skin"] == 2) {
        selectImagePlayer2.layer.position = CGPointMake(button2PlayerSkin2.frame.origin.x + button1PlayerSkin1.frame.size.width / 2, button2PlayerSkin2.frame.origin.y + (button2PlayerSkin3.frame.size.height / 10) * 8);
    }
    else {
        selectImagePlayer2.layer.position = CGPointMake(button2PlayerSkin3.frame.origin.x + button1PlayerSkin1.frame.size.width / 2, button2PlayerSkin3.frame.origin.y + (button2PlayerSkin3.frame.size.height / 10) * 8);
    }
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

- (IBAction)buttonPlayer1Skin1:(id)sender {
    [[NSUserDefaults standardUserDefaults] setInteger:1 forKey:@"player1Skin"];
    [self setSelectImagesToPosition];
    [sound playSelectSound];
}

- (IBAction)buttonPlayer1Skin2:(id)sender {
    [[NSUserDefaults standardUserDefaults] setInteger:2 forKey:@"player1Skin"];
    [self setSelectImagesToPosition];
    [sound playSelectSound];
}

- (IBAction)buttonPlayer1Skin3:(id)sender {
    [[NSUserDefaults standardUserDefaults] setInteger:3 forKey:@"player1Skin"];
    [self setSelectImagesToPosition];
    [sound playSelectSound];
}

- (IBAction)buttonPlayer2Skin1:(id)sender {
    [[NSUserDefaults standardUserDefaults] setInteger:1 forKey:@"player2Skin"];
    [self setSelectImagesToPosition];
    [sound playSelectSound];
}

- (IBAction)buttonPlayer2Skin2:(id)sender {
    [[NSUserDefaults standardUserDefaults] setInteger:2 forKey:@"player2Skin"];
    [self setSelectImagesToPosition];
    [sound playSelectSound];
}

- (IBAction)buttonPlayer2Skin3:(id)sender {
    [[NSUserDefaults standardUserDefaults] setInteger:3 forKey:@"player2Skin"];
    [self setSelectImagesToPosition];
    [sound playSelectSound];
}

@end
