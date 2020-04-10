import QtQuick 2.12
import QtQuick.Controls 2.12
import SortFilterProxyModel 0.2

ApplicationWindow {
    width: 640
    height: 480
    visible: true
    title: "Test"
    color: "#111"

    ListModel {
        id: listModel
        Component.onCompleted: {
            for (let i = 0; i <= 50; i++) {
                append({text: "Item " + i})
                move(count - 1, 0, 1)
            }
        }
    }

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: listModel.move(listModel.count - 1, 0, 1)
    }

    ListView {
        id: listView
        anchors.fill: parent

        move: Transition {
            NumberAnimation { properties: "x,y" }
        }
        displaced: move

        // model: listModel
        model: SortFilterProxyModel {
            sourceModel: listModel
        }

        delegate: Label {
            text: model.text
            font.pixelSize: 24
            color: "#CCC"
            width: listView.width

            Component.onCompleted: print("created:", model.text)
            Component.onDestruction: print("destroyed:", model.text)
        }
    }
}
