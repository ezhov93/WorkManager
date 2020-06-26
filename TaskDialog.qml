import QtQuick 2.12
import QtQuick.Controls 2.12
import "Colors.js" as Colors

Dialog  {
    id: dialog

    signal deleted
    signal saved
    property string msg: ""
    property bool priopity: false

    width: 480
    height: 185
    visible: true
    padding: 0


    Rectangle {
        id: rowInput
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        height: input.height
        anchors.margins: 8
        anchors.topMargin: 24
        TextInput {
            id: input
            text: msg
            anchors.left: parent.left
            anchors.right: parent.right
            font.pixelSize: 18
            onFocusChanged: msg = text
        }
        Rectangle {
            id: dividerHorizontal
            color: Colors.background()
            height: 2
            anchors.top: input.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.topMargin: 4
        }
    }


    Switch {
        id: current
        text: "Приоритет"
        anchors.topMargin: 16
        anchors.top: rowInput.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        font.pixelSize: 18
        anchors.margins: 8
        checked: priopity
        onCheckedChanged: priopity =  checked
    }

    Rectangle {
        id: buttonGroup
        anchors.top: current.bottom
        anchors.margins: 1
        height: deleteButton.height + 16*2
        color: "#efefef"
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.topMargin: 16
    }

    Button {
        id: deleteButton
        text: "Удалить"
        leftPadding: 8
        anchors.left: buttonGroup.left
        anchors.verticalCenter: buttonGroup.verticalCenter
        contentItem: Text {
            text: parent.text
            anchors.left: parent.left
            anchors.leftMargin: 8
            color: Colors.background()
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 18
        }
        background: Rectangle { height: 0 }
        onClicked: { deleted(); }
    }

    Button {
        id: cancel
        text: "Отмена"
        anchors.right: save.left
        anchors.verticalCenter: buttonGroup.verticalCenter
        contentItem: Text {
            text: parent.text
            verticalAlignment: Text.AlignVCenter
            color: Colors.background()
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 18
        }
        background: Rectangle { height: 0 }
        onClicked: { close(); }
    }

    Button {
        id: save
        text: "Сохранить"
        anchors.rightMargin: 8
        anchors.right: buttonGroup.right
        anchors.verticalCenter: buttonGroup.verticalCenter
        contentItem: Text {
            text: parent.text
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 18
            color: Colors.Text
        }
        background: Rectangle {
            color: Colors.background()
            radius: 4
            border.width: 0
        }
        onClicked: { saved(); close(); }
    }
}
