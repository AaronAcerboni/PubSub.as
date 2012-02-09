# Usage

PubSub.as allows ActionScript 3 developers to practice the publish / subscribe pattern
to a similar nature found in JavaScript implementations.

Pub/Sub can be practiced as a stand alone broadcaster.

    var $:PubSub = new PubSub();

    $.sub('myEvent', function(eventName, data){
        trace(data);
    });

    $.pub('myEvent', 'hello');

Or with class inheritance in similar nature to JavaScript's [EventEmitter](https://github.com/Wolfy87/EventEmitter)

    /* Apologies, example to be written */


Subscriptions can be removed by passing the token they return.

   var token:Number = $.sub('myEvent', function(eventName, data){
       // ...
   });

   $.remove(token);

This PubSub library provides alias methods that some programmers may prefer to
use.

`PubSub.pub` == `PubSub.emit`
`PubSub.sub` == `PubSub.on`

# About

PubSub.as is a port of [Morgan Rhoderick's PubSubJS](https://github.com/mroderick/PubSubJS).

Do not take this port to be fully representative of what can be found in the
[Morgan](http://roderick.dk/)'s original source code.