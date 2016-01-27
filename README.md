# FPReachability
Check the status of the network and wifi in iOS application. The library can check whether there is access to a cellular data or WiFi.

# ExtensionID
```xml
<extensions>
    <extensionID>ru.flashpress.FPReachability</extensionID>
</extensions>
```

# Example
To check the Internet connection (via cellular or WiFi), use the following code: 
```ActionScript
import ru.flashpress.reachability.FPReachability;
import ru.flashpress.reachability.FPReachabilityStatus;
//
var reach:FPReachability = FPReachability.createForInternet();
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
```

If you want to check WiFi only, then use the following code: 
```ActionScript
import ru.flashpress.reachability.FPReachability;
//
var reach:FPReachability = FPReachability.createForLocalWifi();
trace(reach.status);
```

To get the event to change the status of the network, use the code: 
```ActionScript
import ru.flashpress.reachability.FPReachability;
import ru.flashpress.reachability.FPReachabilityEvent;
//
var reach:FPReachability = FPReachability.createForInternet();
reach.addEventListener(FPReachabilityEvent.REACHABILITY_CHANGED, reachabilityChangeHandler);
var res:Boolean = reach.startNotifier();
if (res) {
	trace('Wiretapping successfully started, wait for the event ...');
}
//
function reachabilityChangeHandler(event:FPReachabilityEvent):void {
	trace('network status changed:', event.status);
}
```

If you want to check connect to special host:
```ActionScript
var host:String = "http://flashpress.ru"
var reach:FPReachability = FPReachability.createWithHost(host);
trace(reach.status);
```


