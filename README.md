Use UIAutomation without the pain of UIAutomation

Snapshot is awesome. However it drives your app using Apple's UIAutomation which is brittle and painful (and another thing to learn).

If you want to drive your app for Snapshot - and don't care about proper UIAutomation, then this class is for you.

NB: This is not UIAutomation it's just a way to communicate with your app through UIAutomation.

**Usage**

As described in the Snapshot documentation, make sure you have defined SNAPSHOT as true.

e.g. in your Snapfile

    custom_build_args "GCC_PREPROCESSOR_DEFINITIONS='$(inherited) SNAPSHOT=1'"

or use a prefix file and 

    #define SNAPSHOT true

in your App Delegate, install the helper

    HSUIAutomationCheatWindow(mainWindow)

in your SnapshotHelper.js file, add the following function

    function sendNotification(name) {
      UIATarget.localTarget().frontMostApp().windows()["SNAPSHOT_WINDOW"].textFields()["SNAPSHOT_FIELD"].setValue(name);
    }


now you can use the function anywhere in your snapshot.js to send a notification to your app

    sendNotification("SnapDisplayMyScreen");

within your app, a standard NSNotification named @"SnapDisplayMyScreen" will be broadcast.

you can use the SNAPSHOT define to handle this with custom code

    #ifdef SNAPSHOT
    
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(doSomething:)
                                                     name:@"SnapDisplayMyScreen" object:nil];
    
    #endif

**Installation**

Download the class and add it to your project.  When SNAPSHOT is not defined, the class should compile to nothing.
