import QtQuick 2.4

Item {
  property string composer
  property string title
  property string key
  property string catalog

  width: childrenRect.width
  height: childrenRect.height
  Rectangle {
    color: "#222"
    width: childrenRect.width
    height: childrenRect.height
    Column {
      y: 10
      width: childrenRect.width + 20
      height: childrenRect.height + 20
      spacing: 5
      Text {
        text: composer
        color: "#ccc"
        horizontalAlignment: Text.AlignHCenter
        anchors.horizontalCenter: parent.horizontalCenter
      }
      Text { 
        text: title + " in " + key
        color: "#ccc"
        horizontalAlignment: Text.AlignHCenter
        anchors.horizontalCenter: parent.horizontalCenter
      }
      Text { 
        text: catalog
        color: "#ccc"
        horizontalAlignment: Text.AlignHCenter
        anchors.horizontalCenter: parent.horizontalCenter
      }
    }
  }
}
