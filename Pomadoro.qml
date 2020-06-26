import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import "Colors.js" as Colors

Frame {
    id: frame

    signal   modeChanged()
    function modeChange(color) {
        Colors.setBackground(color);
        start.textColor = Colors.background();
        modeChanged();
    }

    width: 480
    rightPadding: 0
    leftPadding: 0
    topPadding: 20
    bottomPadding: 0
    contentHeight: 300
    contentWidth: 480
    anchors.horizontalCenter: parent.horizontalCenter

    background: Rectangle {
        color: Colors.WhiteOpacity
        border.width: 0
        radius: 6
    }

    Row {
        id: buttonsRow
        width: 480

        ModeButton {
            id: round
            text: "Раунд"
            anchors.right:  shortBreak.left
            width: longBreak.width
            onCheckedChanged: modeChange(Colors.Work)
            checked: true
        }

        ModeButton {
            id: shortBreak
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Короткий перерыв"
            width: longBreak.width
            onCheckedChanged: modeChange(Colors.ShortBreak)
        }

        ModeButton {
            id: longBreak
            text: "Длинный перыв"
            checkable: true
            anchors.left:  shortBreak.right
            onCheckedChanged: modeChange(Colors.LongBreak);
        }
    }
    Label {
        id: timer
        font.pixelSize: 100;
        font.bold: true;
        text: "25:00"
        topPadding: this.bottomPadding * 2
        bottomPadding: 20
        anchors.top: buttonsRow.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        color: Colors.Text
    }

    StartButton {
        id: start
        anchors.top: timer.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        backgroundColor: "white"
        textColor: Colors.background()
    }
}
