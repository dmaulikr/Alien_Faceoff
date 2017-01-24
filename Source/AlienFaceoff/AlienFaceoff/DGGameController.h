
#import <UIKit/UIKit.h>
#import "DGInterfaceCount.h"
#import "DGSound.h"

#import "DGViewController.h"

@interface DGGameController : UIViewController{
    DGInterfaceCount *interfaceCount;
    DGSound *sound;
    
    UIImage *player1Simple;
    UIImage *player1Shot;
    UIImage *player2Simple;
    UIImage *player2Shot;
    
    __weak IBOutlet UILabel *scoreLb;
    __weak IBOutlet UILabel *scoreLb2;
    
    NSTimer *timerToShot;
    NSTimer *timerToHideLabel;
    NSTimer *timerOppenentShot;
    NSTimer *timerBlasterShot;
    
    NSInteger value1;
    NSInteger score;
    NSInteger score2;
    
    BOOL flag;
    BOOL shotOneCan;
    BOOL gameContine;
}

@property (weak, nonatomic) IBOutlet UIImageView *shotIndicator;
@property (weak, nonatomic) IBOutlet UIImageView *blasterShot;

@property (weak, nonatomic) IBOutlet UIImageView *player1View;
@property (weak, nonatomic) IBOutlet UIImageView *player2View;

@property (weak, nonatomic) IBOutlet UIImageView *texture1PlayerOne;
@property (weak, nonatomic) IBOutlet UIImageView *texture1PlayerSecond;
@property (weak, nonatomic) IBOutlet UIImageView *texture2PlayerOne;
@property (weak, nonatomic) IBOutlet UIImageView *texture2PlayerSecond;

@property (weak, nonatomic) IBOutlet UIImageView *winLoseIndicator1Player;
@property (weak, nonatomic) IBOutlet UIImageView *winLoseIndicator2Player;
@property (weak, nonatomic) IBOutlet UIImageView *sun;

@property (weak, nonatomic) IBOutlet UIButton *buttonBack;
@property (weak, nonatomic) IBOutlet UIButton *buttonPlayer1;
@property (weak, nonatomic) IBOutlet UIButton *buttonPlayer2;
@property (weak, nonatomic) IBOutlet UIButton *buttonRestart;
@property (weak, nonatomic) IBOutlet UIButton *nextLevel;

- (IBAction)buttonBack:(id)sender;
- (IBAction)buttonPlayer1Shot:(id)sender;
- (IBAction)buttonPlayer2Shot:(id)sender;
- (IBAction)buttonRestartUp:(id)sender;
- (IBAction)nextLevelUp:(id)sender;

@end
