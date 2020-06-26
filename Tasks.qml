import QtQuick 2.12
import QtQuick.Controls 2.12
import "Colors.js" as Colors


Frame {
    id: tasks

    property string textColor: Colors.Text
    property string backgroundColor:Colors.background()
    property int number: 0

    width: 480
    height: 640
    rightPadding: 0
    leftPadding: 0
    topPadding: 20
    bottomPadding: 20
    anchors.horizontalCenter: parent.horizontalCenter

    background: Rectangle {
        color:  backgroundColor
        border.width: 0
    }

    Label {
        id: workingOn
        font.pixelSize: 13;
        font.bold: true;
        text: "Работа над"
        opacity: 0.6
        topPadding: 8
        bottomPadding: 8
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        color: Colors.Text
    }
    Label {
        id: workName
        font.pixelSize: 18;
        font.bold: true;
        text: "Дело"
        topPadding: 8
        bottomPadding: 0
        anchors.top: workingOn.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        color: Colors.Text
    }

    Label {
        id: title
        font.pixelSize: 18;
        font.bold: true;
        text: "Задачи"
        topPadding: 8
        bottomPadding: 8
        anchors.top: workName.bottom
        anchors.left: parent.left
        color: textColor
    }
    Rectangle {
        id: dividerHorizontal
        color: Colors.Stroke
        height: 2
        anchors.top: title.bottom
        anchors.left: parent.left
        anchors.right: parent.right

    }

    AddTask {
        id: addTask
        text: "Добавить задачу"
        anchors.top: dividerHorizontal.bottom
        anchors.topMargin: 18
        onClicked: tasksModel.append({task: "Task " + (++number)})
    }

    ListView {
        id: tasksView
        anchors.top: addTask.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom

        delegate: Task {
            id: task
            anchors.left: parent.left
            anchors.right: parent.right
            onDeleted: tasksModel.remove(index)

            onPriorityChanged: {
                var obj = tasksModel.get(index);
//                        workName.text =
            }
        }
        model: ListModel {
            id: tasksModel
        }
    }

}
