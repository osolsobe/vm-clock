import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;

/**
 * VMCLOCK - Hlavní aplikační třída
 * Watchface aplikace s dvěma režimy zobrazení:
 * - Textový režim: zobrazuje čas a motivační text
 * - Sokolník režim: grafické zobrazení s českými symboly
 */
class VMCLOCKApp extends Application.AppBase {

    function initialize() {
        AppBase.initialize();
    }

    // onStart() is called on application start up
    function onStart(state as Dictionary?) as Void {
    }

    // onStop() is called when your application is exiting
    function onStop(state as Dictionary?) as Void {
    }

    // Return the initial view of your application here
    function getInitialView() as [Views] or [Views, InputDelegates] {
        return [ new VMCLOCKView() ];
    }

}

function getApp() as VMCLOCKApp {
    return Application.getApp() as VMCLOCKApp;
}