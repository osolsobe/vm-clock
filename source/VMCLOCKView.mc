import Toybox.Graphics;
import Toybox.Lang;
import Toybox.WatchUi;
import Toybox.Application;

class VMCLOCKView extends WatchUi.WatchFace {
    
    // Konstanty pro lepší čitelnost kódu
    const TEXT_MODE = 0;
    const SOKOLNIK_MODE = 1;
    const SMALL_SCREEN = 208;
    const LARGE_SCREEN = 320;
    
    private var _displayMode as Number = TEXT_MODE;
    private var _isAwake as Boolean = true;  // Sleduje stav displeje
    private var _screenWidth as Number = 240;
    private var _sokolnikBitmap as BitmapResource or Null = null;  // Cache pro obrázek

    function initialize() {
        WatchFace.initialize();
    }

    // Load your resources here
    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.WatchFace(dc));
        
        // Zjistíme rozměry displeje
        _screenWidth = dc.getWidth();
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() as Void {
        // Načteme obrázek jednou při zobrazení
        _sokolnikBitmap = WatchUi.loadResource(Rez.Drawables.SokolnikImage);
        
        // Načteme nastavení jednou při zobrazení
        var mode = Application.Properties.getValue("DisplayMode");
        if (mode != null && mode instanceof Number) {
            _displayMode = mode as Number;
        } else {
            _displayMode = TEXT_MODE;
        }
    }

    // Update the view
    function onUpdate(dc as Dc) as Void {
        // Clear the screen - ČERNÉ pozadí
        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_BLACK);
        dc.clear();
        
        // Optimalizace pro sleep režim - jednodušší kreslení
        if (!_isAwake && _displayMode == SOKOLNIK_MODE) {
            drawSimpleTimeOnly(dc);
            return;
        }
        
        switch (_displayMode) {
            case TEXT_MODE:
                drawTextMode(dc);
                break;
            case SOKOLNIK_MODE:
                drawImageMode(dc);
                break;
        }
    }
    
    /**
     * Kreslí pouze text - optimalizováno pro sleep režim
     */
    function drawSimpleTimeOnly(dc as Dc) as Void {
        var centerX = dc.getWidth() / 2;
        var centerY = dc.getHeight() / 2;
        
        var customText = "Bezčasí";
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        dc.drawText(centerX, centerY, Graphics.FONT_MEDIUM, customText, Graphics.TEXT_JUSTIFY_CENTER);
    }

    /**
     * Kreslí textový režim - zobrazuje pouze vlastní text (responzivní)
     */
    function drawTextMode(dc as Dc) as Void {
        var centerX = dc.getWidth() / 2;
        var centerY = dc.getHeight() / 2;
        
        // Výběr velikosti fontu podle velikosti displeje - OPRAVENO
        var fontSize = Graphics.FONT_MEDIUM;  // Výchozí velikost
        if (_screenWidth <= SMALL_SCREEN) {
            fontSize = Graphics.FONT_SMALL; // Malé hodinky - menší font
        } else if (_screenWidth >= LARGE_SCREEN) {
            fontSize = Graphics.FONT_LARGE; // Velké hodinky - větší font
        }
        
        // Vlastní text uprostřed - BÍLÝ text
        var customText = "Je čas na bezčasí";
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        dc.drawText(centerX, centerY, fontSize, customText, Graphics.TEXT_JUSTIFY_CENTER);
    }
    
    /**
     * Kreslí grafický režim - "Český sokolník" obrázek (kompatibilní se staršími zařízeními)
     */
    function drawImageMode(dc as Dc) as Void {
        var centerX = dc.getWidth() / 2;
        var centerY = dc.getHeight() / 2;
        
        // Použijeme cached obrázek místo opakovaného načítání
        if (_sokolnikBitmap != null) {
            // Získáme rozměry obrázku
            var bitmapWidth = _sokolnikBitmap.getWidth();
            var bitmapHeight = _sokolnikBitmap.getHeight();
            
            // Jednoduché vycentrování podle skutečných rozměrů obrázku
            var x = centerX - (bitmapWidth / 2);
            var y = centerY - (bitmapHeight / 2);
            
            // Nakreslíme obrázek vycentrovaný
            dc.drawBitmap(x, y, _sokolnikBitmap);
        } else {
            // Fallback - pokud se obrázek nepodaří načíst, zobrazíme bílý text
            dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
            dc.drawText(centerX, centerY, Graphics.FONT_MEDIUM, "Sokolník", Graphics.TEXT_JUSTIFY_CENTER);
        }
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() as Void {
    }

    // The user has just looked at their watch. Timers and animations may be started here.
    function onExitSleep() as Void {
        _isAwake = true;
    }

    // Terminate any active timers and prepare for slow updates.
    function onEnterSleep() as Void {
        _isAwake = false;
    }

}
