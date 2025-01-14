import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Rectangle {
    id: chatArea
    color: "#FFFFFF"
    border.color: "#D3D3D3"
    anchors.margins: 10

    ColumnLayout {
        anchors.fill: parent

        ListView {
            id: messageList
            Layout.fillHeight: true
            Layout.fillWidth: true
            model: ListModel {
                ListElement { sender: "Alice"; message: "Hi there!" }
                ListElement { sender: "Me"; message: "Hello!" }
                ListElement { sender: "Alice"; message: "How are you?" }
            }
            delegate: Row {
                spacing: 10
                Text {
                    text: sender + ":"
                    font.pixelSize: 16
                    font.bold: true
                }
                Text {
                    text: message
                    font.pixelSize: 16
                }
            }
        }

        RowLayout {
            Layout.fillWidth: true
            spacing: 10

            TextField {
                id: inputField
                placeholderText: "Type a message"
                Layout.fillWidth: true
            }

            Button {
                text: "Send"
                onClicked: {
                    if (inputField.text !== "") {
                        messageList.model.append({ sender: "Me", message: inputField.text })
                        inputField.clear()
                    }
                }
            }
        }
    }
}
