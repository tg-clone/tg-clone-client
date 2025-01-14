import QtQuick 2.15

Item {
    property string chatName
    width: parent.width
    height: 50

    Rectangle {
        id: itemBackground
        anchors.fill: parent
        color: (index % 2 == 0) ? "#FFFFFF" : "#EFEFEF"
        Behavior on color {
            ColorAnimation {
                duration: 200
            }
        }

        Text {
            text: model.chatName
            anchors.centerIn: parent
            font.pixelSize: 24
        }

        MouseArea {
            anchors.fill: parent
            onPressed: {
                itemBackground.color = "#AED581"  // Цвет фона при нажатии
            }
            onReleased: {
                itemBackground.color = (index % 2 == 0) ? "#FFFFFF" : "#EFEFEF"
            }
        }
    }
}
