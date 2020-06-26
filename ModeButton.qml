import QtQuick 2.12
import QtQuick.Controls 2.12
import "Colors.js" as Colors

RadioButton {
    id: modeButton
    text: "modeButton"
    checkable: true
    contentItem: Text {
        text: parent.text
        font.pointSize: 12
        color: Colors.Text
        topPadding: 2
        bottomPadding: 2
        rightPadding: 12
        leftPadding: 12
        horizontalAlignment: Text.AlignHCenter
    }
    background: Rectangle {
        color:  Colors.BlackOpacity
        opacity: parent.checked ? 1 : 0
        border.width: 0
        radius: 4
    }

    indicator: Rectangle {
        implicitWidth: 0
        implicitHeight: 0
    }
}


/*##^##
Designer {
    D{i:0;formeditorZoom:2}
}
##^##*/
