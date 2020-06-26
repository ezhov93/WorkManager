import QtQuick 2.12
import QtQuick.Controls 2.12
import "Colors.js" as Colors

Row {
    id: task

    signal deleted
    signal priorityChanged
    property alias msg: taskDialog.msg

    topPadding: 18
    height: label.height+topPadding


    TaskDialog {
        id: taskDialog
        onSaved:  {
            label.text = taskDialog.msg
            if(taskDialog.priopity == true) {
                priorityChanged(priopity);
            }
        }
        onDeleted: task.deleted()
    }

    Rectangle {
        id: rec
        width: parent.width
        height: label.height
        color: "#b3ffffff"
        radius: 4

        Label {
            id: label
            text: "Пустая задача"
            font.pixelSize: 16
            anchors.left: parent.left
            verticalAlignment: Text.AlignVCenter
            anchors.verticalCenter: parent.verticalCenter
            leftPadding: 20
            height: 40
        }

        Button {
            id: button
            anchors.right: parent.right
            height: parent.height
            text: ""
            background: Rectangle {
                color: rec.color
            }

            Image {
                id: icon
                source: "vertical-ellipsis.png"
                scale: 0.25
                fillMode: Image.PreserveAspectFit
                anchors.centerIn: parent
            }
            rightPadding: 50
            onClicked: taskDialog.open()
        }
    }
}
