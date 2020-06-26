import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import "Colors.js" as Colors

ApplicationWindow {
    id: application
    visible: true
    width: 640
    height: 480
    color: Colors.background()
    title: "Work Manager"

    font.family: "ArialRounded"

    ScrollView
    {
        width: parent.width
        height : parent.height
        contentWidth: parent.width    // The important part
        contentHeight: pomadoro.height + tasks.height

        Pomadoro {
            id: pomadoro
            onModeChanged: {
                application.color = Colors.background();
                tasks.backgroundColor = Colors.background();
            }
        }

        Tasks {
            id: tasks
            anchors.top: pomadoro.bottom
            textColor: Colors.Text
            backgroundColor: Colors.background()
        }
    }
}



