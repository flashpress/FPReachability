package {

    import flash.display.Sprite;
    import flash.text.TextField;

    import ru.flashpress.reachability.FPReachability;
    import ru.flashpress.reachability.FPReachabilityEvent;
    import ru.flashpress.reachability.FPReachabilityStatus;

    public class Main extends Sprite
    {
        public function Main()
        {
            create(false);
        }

        private function create(wifiOnly:Boolean, host:String=null):void
        {
            var reach:FPReachability;
            if (!host) {
                if(!wifiOnly) {
                    reach = FPReachability.createForInternet()
                } else {
                    reach = FPReachability.createForLocalWifi();
                }
            } else {
                reach = FPReachability.createWithHost(host);
            }
            //
            switch (reach.status) {
                case FPReachabilityStatus.NOT_REACHABLE:
                    trace('No Internet access');
                    break;
                case FPReachabilityStatus.REACHABLE_VIA_WIFI:
                    trace('Internet is accessible via WiFi');
                    break;
                case FPReachabilityStatus.REACHABLE_VIA_WWAN:
                    trace('Internet is available via cellular data');
                    break;
            }
            reach.addEventListener(FPReachabilityEvent.REACHABILITY_CHANGED, internetChangeHandler);
            var res:Boolean = reach.startNotifier();
            trace('start notify result:', res);
        }
        private function internetChangeHandler(event:FPReachabilityEvent):void
        {
            trace('internet status:', event.status);
        }
    }
}
