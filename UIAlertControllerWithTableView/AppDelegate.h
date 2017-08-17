//
//  AppDelegate.h
//  UIAlertControllerWithTableView
//
//  Created by Ali AS. Salman on 17/08/2017.
//  Copyright © 2017 Ali AS. Salman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

