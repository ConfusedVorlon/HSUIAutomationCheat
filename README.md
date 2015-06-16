##Use UIAutomation without the pain of UIAutomation

Snapshot is awesome. 

However it drives your app using Apple's UIAutomation which is brittle and painful (and another thing you have to learn).

If you want to drive your app for [Snapshot][1] - and don't care about proper UIAutomation, then this class is for you.

NB: This is not 'real' UIAutomation it's just a way to communicate with your app easily through UIAutomation.

##Usage

 1. As described in the Snapshot
    documentation, make sure you have
    defined SNAPSHOT as true.

    e.g. in your Snapfile

        custom_build_args "GCC_PREPROCESSOR_DEFINITIONS='$(inherited) SNAPSHOT=1'"

    or use a prefix file and 

        #define SNAPSHOT true

 2. In your App Delegate, install the
    helper

    This will install a 1 pixel text field behind your views on your main window. UIAutomation can then change the text field in order to trigger notifications.

        HSUIAutomationCheatWindow(mainWindow);

 3. Add a helper function to Snapshot.js

    function sendNotification(name) {

      UIATarget.localTarget().frontMostApp().windows()["SNAPSHOT_WINDOW"].textFields()["SNAPSHOT_FIELD"].setValue(name);

    }

 4. Send notifications from your
    snapshot.js

    Anywhere in your snapshot.js you can send a notification to your app

        sendNotification("SnapDisplayMyScreen");

 5. Respond to notifications within your
    app

    within your app, a standard NSNotification named @"SnapDisplayMyScreen" will be broadcast.

    you can use the SNAPSHOT define to handle this with custom code

        #ifdef SNAPSHOT
        
            [[NSNotificationCenter defaultCenter] addObserver:self
                                                     selector:@selector(doSomething:)
                                                         name:@"SnapDisplayMyScreen" object:nil];
        
        #endif

##Installation

Install with CocoaPods

    pod 'HSUIAutomationCheat', '~> 0.0'

or download the class and add it to your project.  
You can safely include this in production code; When SNAPSHOT is not defined, the class will compile to nothing.


  [1]: https://github.com/KrauseFx/snapshot