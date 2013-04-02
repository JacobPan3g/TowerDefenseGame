//
//  Tower.h
//  TowerDefenseGame
//
//  Created by Jacob on 13-4-2.
//
//

#import "CCNode.h"

#import "cocos2d.h"
#import "HelloWorldLayer.h"

#define kTOWER_COST 300

@class HelloWorldLayer, Enemy;

@interface Tower : CCNode
{
    int attachRange;
    int damage;
    float fireRate;
}

@property (nonatomic, assign) HelloWorldLayer *theGame;
@property (nonatomic, assign) CCSprite *mySprite;

+ (id)nodeWithTheGame:(HelloWorldLayer *)_game location:(CGPoint)location;
- (id)initWithTheGame:(HelloWorldLayer *)_game location:(CGPoint)location;

@end
