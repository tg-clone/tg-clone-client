import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Rectangle {
    width: 400
    height: 600
    color: "#FFFFFF"

    ColumnLayout {
        anchors.fill: parent

        ListView {
            id: messageList
            Layout.fillHeight: true
            Layout.fillWidth: true
            model: chatViewModel

            delegate: Row {
                spacing: 10
                Text {
                    text: model.sender + ":"
                    font.pixelSize: 16
                    font.bold: true
                }
                Text {
                    text: model.text
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
                        // Здесь можно добавить отправку сообщений
                        inputField.clear()
                    }
                }
            }
        }
    }
}
