import QtQuick 2.9
import QtQuick.Controls 2.2

TextField {
    id: root
    implicitWidth: 170
    implicitHeight: 50
    background: Rectangle{
        id: backItem
        color: "yellow"
        property real leftHeight: 0
        onLeftHeightChanged: canvas.requestPaint();
        Canvas{
            id: canvas
            anchors.fill: parent
            property real margins: 5
            onPaint: {
                var ctx = getContext("2d");
                ctx.reset();
                ctx.moveTo(margins, margins + backItem.leftHeight);
                ctx.quadraticCurveTo(20, height - margins, 40, height - margins);
                ctx.lineTo(width - margins, height - margins);
                ctx.strokeType = "black";
                ctx.lineWidth = 2;
                ctx.stroke();
            }
        }
        states:[
            State{
                name: "focused"
                when: root.focus
                PropertyChanges {
                    target: backItem
                    leftHeight: canvas.margins * 2
                }
            }

        ]
        transitions: [
            Transition {
                to: "focused"
                NumberAnimation { properties: "leftHeight"; easing.type: Easing.InOutQuad }
            }
        ]
    }
}
