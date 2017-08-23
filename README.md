# *tippy*

**tippy** is a tip calculator application for iOS.

Submitted by: **Puja Roy**

Time spent: **10** hours spent in total

## User Stories

The following **required** functionality is complete:

* [x] User can enter a bill amount, choose a tip percentage, and see the tip and total values.
* [x] Settings page to change the default tip percentage.

The following **optional** features are implemented:
* [x] UI animations
* [x] Remembering the bill amount across app restarts (if <10mins)
* [x] Using locale-specific currency and currency thousands separators.
* [x] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.

## Video Walkthrough 

Here's a walkthrough of implemented user stories:

<img src= 'http://i.imgur.com/FLXPJ25.gifv'  width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Project Analysis

As part of your pre-work submission, please reflect on the app and answer the following questions below:

**Question 1**: "What are your reactions to the iOS app development platform so far? How would you describe outlets and actions to another developer? Bonus: any idea how they are being implemented under the hood? (It might give you some ideas if you right-click on the Storyboard and click Open As->Source Code")

**Answer:** 
ios App development was pretty easy to start with installion and building the first app.The starter video was of great help and getting more details fro different documentation.

Actions and outlets in iOS are referred to as ibActions and ibOutlets respectively, where ib stands for interface builder.They are ways using which the view controller interacts with views.
IBOUTLET is used as a property in a view controller.It allows one to change properties like text,color,size etc of a control while the IBACTION is a method in a viewcontroller.It is used for an event to trigger code.For example one would  use an IBOUTLET when one wanted to change the way something looked like the text font of button.When the button is tapped to get something changed that would be an action.

The concept is similar to an HTML page.On having a look at the Storyboard source code all the ui componenets are captured in the form of an xml file.The connections tag of the controls has the relevant outlets(property) and actions(method).

Question 2: "Swift uses [Automatic Reference Counting](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/AutomaticReferenceCounting.html#//apple_ref/doc/uid/TP40014097-CH20-ID49) (ARC), which is not a garbage collector, to manage memory. Can you explain how you can get a strong reference cycle for closures? (There's a section explaining this concept in the link, how would you summarize as simply as possible?)"

**Answer:**

ARC is a memory management technique of swift which happens at compile time rather than runtime(like GC ).Reference cycles for objects occur when properties reference each other.Closures are also reference types and can cause cycles. Closures capture the objects that they operate on.
      
For example, if a closure is assigned to the property of a class, and that closure uses instance properties of that same class, you have a reference cycle. In other words, the object holds a reference to the closure via a stored property; the closure holds a reference to the object via the captured value of self.In order to solve the issue we use capture list in which you define the relationships between the closure and the objects it captures.


