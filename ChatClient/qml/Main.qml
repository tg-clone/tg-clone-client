import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    visible: true
    width: 800
    height: 600
    title: "Telegram 2.0"

    SplitView {
        anchors.fill: parent
        orientation: Qt.Horizontal

        ChatList {
            SplitView.preferredWidth: parent.width * 0.3
            SplitView.minimumWidth: parent.width * 0.1
        }

        ChatArea {
            color: "#4682B4"
            SplitView.minimumWidth: parent.width * 0.1
        }
    }
}
