import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Layouts 1.3

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    ColumnLayout{
        anchors.centerIn: parent
        spacing: 10
        FunnyTextField{
            id: funnyTextField1

            font{family: "Arial"; pixelSize: 15}
        }
        FunnyTextField{
            id: funnyTextField2
            font{family: "Arial"; pixelSize: 15}
        }
    }


}
