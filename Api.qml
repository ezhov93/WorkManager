import QtQuick 2.12
import QtQuick.Window 2.12

Item {
    property int dpi: Screen.pixelDensity * 25.4
    function dp(x){
        if(dpi < 120) {
            return x;
        } else {
            return x*(dpi/160);
        }
    }
}
