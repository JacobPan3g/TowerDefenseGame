//
//  HelloWorldLayer.h
//  TowerDefenseGame
//
//  Created by Jacob on 13-4-2.
//  Copyright __MyCompanyName__ 2013年. All rights reserved.
//


#import <GameKit/GameKit.h>

// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"

// HelloWorldLayer
@interface HelloWorldLayer : CCLayer
{
    NSMutableArray *towerBases;
}

@property (nonatomic, retain) NSMutableArray *towers;

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;

@end
