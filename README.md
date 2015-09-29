# Drop-in iOS Crash Analysis with HP AppPulse Mobile



<!--- Motivation - Explain why crash analysis is critical to monitor in mobile apps, how it’s not possible to cover all use cases and device/OS matrix during testing.

- Why crash log isn’t enough – Describe example or two of crashes that their root cause is hard to understand just by crash logs. For example, crashes that are related to the activity or fragment lifecycle. The point should be that in many cases you need to know what

- Describe automatic crash trail by AppPulse Mobile – Explain how it solves the problem of the previous example.

- SDK breadcrumbs API – Say that automatic crash trail is great for most cases but sometimes there’s a need to see internal data that is only known in the context of the app (e.g. – server to which is it connected)
-->

v0.2

---

(plan)

- intro
- creating buggy app with Xcode and Swift
- registering AppPule accouny
- adding AppPule to the project
- viewing the reports, email notifications
- conclusion

---

## Why?

Every developer strives to write his code in a best possible manner and avoid bugs before they ship to end-user device. However in reality the only bug-free software is the one that doesn't exist.

Some issues are caused by errors in application code and can be cought with extensive testing, while others can occure only due to some very specific combination of device/carrier/usage scenario/whatever. The best thing to catch those – is to essentially turn end-user device into your test rig. Sounds like testing in production, but with billions devices out there, since your app crashes anyway, it's better to at least know why.

One may ask: _"Why adding another library that automates crash reporting? When something happens I will just ask my users to shoot me an email describing what they did and what buttons they tapped."_

The thing is when 100 users experience an error only 1 may be willing to get into trouble writing an actual report. Other may just silently uninstall an app or, worse, give it a one-star rating before doing so. So it's critical to be informed about the error before there is a critical mass of disappointed users.

Now imagine there is a drop-in solution that can provide you with all the neccessary information in an event of an error – the device type, OS version, what user actions led to an error, etc. [HP AppPulse Mobile](http://www8.hp.com/us/en/software-solutions/apppulse-mobile-app-apm-monitoring/) is exactly that. With AppPule Mobile every error or crash actually helps you to improve your application.

This tutorial shows how you can add HP AppPulse support into your application and what are the benefits you get.

## Creating a Buggy iOS Application

Clone a repository from [https://github.com/myurasov/HP-AppPulse-Mobile-iOS-Crash-Reporting/](https://github.com/myurasov/HP-AppPulse-Mobile-iOS-Crash-Reporting/):

```
$ git clone -d app-template https://github.com/myurasov/HP-AppPulse-Mobile-iOS-Crash-Reporting.git myapp
$ open -e myapp/Crashy.xcodeproj
```

Main view looks like this:

![image](images/view1.png)

The app template already has action outlets defined for the buttons on one of the tabs.

Open __FirstViewController.m__ in the code editor and add the following snippet:

```
- (void)throwCustomException {
    @throw [[NSException alloc] initWithName:@"Custom" reason:@"Testing" userInfo:nil];
}
```

It creates an exception with our custom message and throws it. Now if you add the following code:

```
[self throwCustomException];
```

to both _onButton1Tap_ and _onButton2Tap_ methods, the application (when deployed to end-user device) will just silently crash on either button press without letting anyone knowing why it crashed. Let's solve this problem in the next part by adding HP AppPulse Mobile to our project.


## Adding AppPulse Mobile to Your Project

### Adding the SDK

The process of adding AppPulse Mobile is pretty-straightforward:

* Go to [http://www8.hp.com/us/en/software-solutions/apppulse-mobile-app-apm-monitoring/index.html](http://www8.hp.com/us/en/software-solutions/apppulse-mobile-app-apm-monitoring/index.html) and start your free trial. Then make sure AppPule Mobile is enabled in your HP SAAS control panel.

 
* Navigate to AppPulse Mobile control panel and press + to create a new iOS application. Enter your application name and the modal window with a detailed instruction will pop up. Make sure you download and add the AppPulsemobile framework to your project and set the _AppId_ parameter in __hprunmonitor.plist__.

Bingo! Now when you launch your application you should see something like the following message in your Xcode console area:

![](images/console.png)

Congratulations, you now have access to the usage statistics and performance metrics without writing a single line of code.

Let's learn how we can use HP AppPulse Mobile to benefit from it's error and crash reporting capabilities.

##

## Viewing the Reports

## Conclusion



