# What's this?

PubSub.as allows ActionScript 3 developers to practice the publish / subscribe pattern
to a similar nature found in JavaScript implementations.

PubSub.as is a port of [Morgan Roderick's PubSubJS](https://github.com/mroderick/PubSubJS).

Do not take this port to be fully representative of what can be found in the
[Morgan](http://roderick.dk/)'s original source code.

# Usage

Pub/Sub can be practiced as a stand alone broadcaster.

    var $:PubSub = new PubSub();

    $.sub('myEvent', function(evt, data){
        trace(data);
        // > outputs 'hello'
    });

    $.pub('myEvent', 'hello');

Or with class inheritance in similar nature to JavaScript's [EventEmitter](https://github.com/Wolfy87/EventEmitter)

    public class Waiter extends PubSub {

      public function Waiter(){
        bringFood();
      }

      private function bringFood():void{
        this.emit('serve', 'cake');
      }

    }

    // ...

    var waiter:Waiter = new Waiter();

    waiter.on('serve', function(evt, food){
      man.eat(food);
    })


Subscriptions can be removed by passing the token they return.

    var token:Number = $.sub('myEvent', function(eventName, data){
        // ...
    });

    $.remove(token);

This PubSub library provides alias methods that some programmers may prefer to
use.

`PubSub.pub` == `PubSub.emit`

`PubSub.sub` == `PubSub.on`