import QtQuick 2.12
import QtQuick.Controls 2.12
import "Colors.js" as Colors

Button {
    id: addTask

    property string textColor: Colors.Text
    property string backgroundColor: Colors.BlackOpacity

    text: "Добавить задачу"
    width: parent.width
    height: 60
    Row {
        id: row1
        anchors.centerIn: parent
        Image {
            id: icon
            source: "plus-circle-white.png"
            scale: 0.25
            fillMode: Image.PreserveAspectFit
            anchors.right: text.left
        }
        Text {
            id: label
            text: parent.parent.text
            color: textColor
            font.pixelSize: 16
            verticalAlignment: Text.AlignVCenter
            anchors.verticalCenter: parent.verticalCenter
        }
    }
    background: Rectangle {
        color:  Colors.BlackOpacity
        border.width: 0
        radius: 8
    }
    contentItem: Text {

    }
}
