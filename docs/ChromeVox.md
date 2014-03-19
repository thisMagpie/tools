#Summary ChromeVox API

## ChromeVox API 

The ChromeVox API allows web applications to interact with !ChromeVox in order to provide smoother, richer auditory user interfaces.

These APIs allow web developers to make !ChromeVox speak custom messages, play earcons, and set !ChromeVox's internal reading position.


## Details

The following JavaScript methods are available:

```
cvox.Api.speak(textString, queueMode, properties)
```
Where textString is the string of text to be spoken, queueMode has valid modes of 0 for flush and 1 for queue and properties for speech properties to use for this utterance.

```
queueMode

```
####Properties  

Speech properties to use for this utterance.

####cvox.Api.stop()```
    Stops speech.

####cvox.Api.playEarcon(earcon)

Plays the specified earcon sound.

####earcon An earcon name. Valid names are:

     ALERT_MODAL

     ALERT_NONMODAL

     BULLET

     BUSY_PROGRESS_LOOP

     BUSY_WORKING_LOOP

     BUTTON

     CHECK_OFF

     CHECK_ON

     COLLAPSED

     EDITABLE_TEXT

     ELLIPSIS

     EXPANDED

     FONT_CHANGE

     INVALID_KEYPRESS

     LINK

     LISTBOX

     LIST_ITEM

     NEW_MAIL

     OBJECT_CLOSE

     OBJECT_DELETE

     OBJECT_DESELECT

     OBJECT_OPEN

     OBJECT_SELECT

     PARAGRAPH_BREAK

     SEARCH_HIT

     SEARCH_MISS

     SECTION

     TASK_SUCCESS

     WRAP

     WRAP_EDGE

To Synchronise ChromeVox's internal cursor to the targetNode use:

```
cvox.Api.syncToNode(targetNode)
```

Note that this will NOT trigger reading; it is only for setting the internal !ChromeVox cursor so that when the user resumes reading, they will be starting from a reasonable position.

####targetNode

The node that !ChromeVox should be synced to.

[The Javascript file](http://code.google.com/p/google-axs-chrome/source/browse/trunk/chromevox/chromevox/injected/api.js that defines the ChromeVox API)
