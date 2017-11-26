import QtQuick 2.4
import "ApiClient.js" as API

Item {
  property string cfirst
  property string clast
  property string title
  property string key
  property string catalog
  property string id
  property string textColor: "#ccc"
  property string background: "#222"

  width: childrenRect.width
  height: childrenRect.height
  Rectangle {

    color: background
    width: childrenRect.width
    height: childrenRect.height

    Column {
      y: 10
      width: childrenRect.width + 20
      height: childrenRect.height + 20
      spacing: 5
      Text {
        text: cfirst + ' ' + clast
        color: textColor
        horizontalAlignment: Text.AlignHCenter
        anchors.horizontalCenter: parent.horizontalCenter
      }
      Text { 
        text: title + " in " + key
        color: textColor
        horizontalAlignment: Text.AlignHCenter
        anchors.horizontalCenter: parent.horizontalCenter
      }
      Text { 
        text: catalog
        color: textColor
        horizontalAlignment: Text.AlignHCenter
        anchors.horizontalCenter: parent.horizontalCenter
      }
    }

    MouseArea {
      anchors.fill: parent
      hoverEnabled: true
      onEntered: {
        textColor = "#1c5d99";
      }
      onExited: {
        textColor = "#ccc";
      }
      onClicked: {
        console.log("piece click: " + id);

        API.getPieceInfo(id, function (js) {

          mainStackView.push( 
            Qt.resolvedUrl("AddPerformance.qml"), 
            { 
              cfirst: js.cfirst,
              clast: js.clast,
              title: js.title,
              key: js.key,
              catalog: js.catalog,
              movements: js.movements,
              parts: js.parts
            }
          );

        });
      }
    }
  }
}
