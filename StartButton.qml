import QtQuick 2.12
import QtQuick.Controls 2.12
import "Colors.js" as Colors

Button {
    id: button

    property string textColor: Colors.background()
    property string backgroundColor: "white"

    text: this.checked? "СТОП" : "СТАРТ"
    checkable: true
    width: 200

    contentItem: Text {
        font.bold: true
        text: parent.text
        horizontalAlignment: Text.AlignHCenter
        rightPadding: 12
        leftPadding: 12
        topPadding: 20
        bottomPadding: 20
        color: textColor
        font.pixelSize: 22
    }

    background: Rectangle {
        color: backgroundColor
        opacity: 1
        border.width: 0
        radius: 4
    }
}
