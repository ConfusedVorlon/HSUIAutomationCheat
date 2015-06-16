//
//  HSSnapshotChat.m
//  VLCRemote2
//
//  Created by Rob Jonson on 05/06/2015.
//
//

#ifdef SNAPSHOT

#import "HSUIAutomationCheat.h"
#import "HSCloudDefaults.h"

@interface HSUIAutomationCheat ()

@property (retain) UITextField *field;

@end

@implementation HSUIAutomationCheat

+(void)installForWindow:(UIWindow*)window
{
    window.accessibilityLabel=@"SNAPSHOT_WINDOW";
    
    HSUIAutomationCheat *sharedInstance=[HSUIAutomationCheat sharedInstance];
    [window addSubview:sharedInstance.field];
}



+ (instancetype)sharedInstance
{
    static dispatch_once_t once;
    static id sharedInstance;
    dispatch_once(&once, ^{
        
        sharedInstance = [[self alloc] init];

    });
    return sharedInstance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        UITextField *field=[[UITextField alloc] initWithFrame:CGRectMake(0, 0, 1, 1)];
        field.accessibilityLabel=@"SNAPSHOT_FIELD";
        
        [field addTarget:self
                  action:@selector(textFieldDidChange:)
        forControlEvents:UIControlEventEditingChanged];
        
        self.field=field;
        
    }
    return self;
}


-(void)textFieldDidChange:(id)sender
{
    [sender resignFirstResponder];
    
    NSString *text=self.field.text;
    
    NSLog(@"Snap notification: %@",text);
    [[NSNotificationCenter defaultCenter] postNotificationName:text object:self];
    
}

@end

#endif
