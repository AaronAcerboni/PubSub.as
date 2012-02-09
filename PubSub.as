package  {

    import flash.utils.Timer;
    import flash.events.TimerEvent;

    public class PubSub {

        private var messages:Object = new Object();
        private var lastUid:Number = -1;

        public function PubSub() {}

        private function setTimeout(fn:Function, time:Number = 0):void {
            var t:Timer = new Timer(time,1);
            var finish = function(){
                fn();
                t.removeEventListener(TimerEvent.TIMER_COMPLETE, finish);
            };
            t.addEventListener(TimerEvent.TIMER_COMPLETE, finish);
            t.start();
        }

        private function publish(message:String, data:Object):Object {
            // If there are no subscribers for this message
            if( !messages[message] ){
                return false;
            }

            var deliverMessage:Function = function(){
                var subscribers = messages[message];
                var throwException = function(e){
                    return function(){
                        throw e;
                    }
                };

                for (var i:Number = 0, j = subscribers.length; i < j; i++){
                    try {
                        subscribers[i]['fn'](message:String, data:Object);
                    } catch(e){

                        throwException(e);
                        setTimeout(function(e){
                            throwException(e);
                        });
                    }
                }

            };

            setTimeout(deliverMessage);
            //deliverMessage();

            return true;
        }

        public function pub(message:String, data:Object):Object {
            return publish( message, data );
        }

        public function emit(message:String, data:Object):Object {
            return publish( message, data );
        }

        public function sub(message:String, fn:Function):Number {
            return on(message, fn);
        }

        public function on(message:String, fn:Function):Number {
            // Message not registered yet
            if( !messages[message] ){
                messages[message] = [];
            }

            var binding:Object = new Object();
            lastUid++;
            binding['token'] = lastUid;
            binding['fn'] = fn;

            messages[message].push(binding);

            return lastUid;
        }

        public function remove(uid:Number):Boolean {
            for(var m in messages){
                if(messages[m]){
                    for(var i:Number = 0, j = messages[m].length; i < j; i++){
                        if( messages[m][i]['token'] === uid ){
                            return messages[m].splice(i, 1);
                            return uid;
                        }
                    }
                }
            }
            return false;
        }

    }

}