//
//  HelloWorldLayer.m
//  TowerDefenseGame
//
//  Created by Jacob on 13-4-2.
//  Copyright __MyCompanyName__ 2013年. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"

// Needed to obtain the Navigation Controller
#import "AppDelegate.h"

#import "Tower.h"

#pragma mark - HelloWorldLayer

// HelloWorldLayer implementation
@implementation HelloWorldLayer

@synthesize towers;

// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

-(void)loadTowerPositions
{
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"TowersPosition" ofType:@"plist"];
    NSArray *towerPostitions = [NSArray arrayWithContentsOfFile:plistPath];
    towerBases = [[NSMutableArray alloc] initWithCapacity:10];
    
    for (NSDictionary *towerPos in towerPostitions) {
        CCSprite *towerBase = [CCSprite spriteWithFile:@"open_spot.png"];
        [self addChild:towerBase];
        [towerBase setPosition:ccp([[towerPos objectForKey:@"x"] intValue], [[towerPos objectForKey:@"y"] intValue])];
        [towerBases addObject:towerBase];
    }
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super's" return value
	if( (self=[super init]) ) {
		self.isTouchEnabled = YES;
		CGSize wins = [CCDirector sharedDirector].winSize;
        
        // set background
        CCSprite *background = [CCSprite spriteWithFile:@"Bg.png"];
        [self addChild:background];
        [background setPosition:ccp(wins.width/2, wins.height/2)];
        
        [self loadTowerPositions];
	}
	return self;
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	[towerBases release];
    towerBases = nil;
    [towers release];
    towers = nil;
    
	// don't forget to call "super dealloc"
	[super dealloc];
}

- (BOOL)canBuyTower
{
    return YES;
}

- (void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    for ( UITouch *touch in touches )
    {
        CGPoint location = [touch locationInView:[touch view]];
        location = [[CCDirector sharedDirector] convertToGL:location];
        
        for ( CCSprite *tb in towerBases )
        {
            if ([self canBuyTower] && CGRectContainsPoint([tb boundingBox], location) && !tb.userData)
            {
                Tower *tower = [Tower nodeWithTheGame:self location:tb.position];
                [towers addObject:tower];
                tb.userData = tower;
            }
        }
    }
}

@end
