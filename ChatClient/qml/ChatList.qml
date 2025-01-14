import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Rectangle {
    id: sidebar
    color: "#F5F5F5"
    border.color: "#D3D3D3"

    ColumnLayout {
        anchors.fill: parent
        spacing: 10

        Text {
            text: "Chats"
            font.bold: true
            font.pixelSize: 24
            horizontalAlignment: Text.AlignHCenter
            Layout.alignment: Qt.AlignHCenter
            Layout.margins: 10
        }

        ListView {
            id: chatList
            Layout.fillWidth: true
            Layout.fillHeight: true
            model: ListModel {
                ListElement { chatName: "Alice" }
                ListElement { chatName: "Bob" }
                ListElement { chatName: "Charlie" }
            }
            delegate: ChatItem {
                chatName: chatName
            }
            highlightFollowsCurrentItem: true
        }
    }
}
