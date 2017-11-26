import QtQuick 2.4
import QtQuick.Layouts 1.2
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

Item {
  property string part

  Layout.minimumHeight: 40
  Layout.fillWidth: true

  RowLayout {

    anchors.fill: parent
    Label {
      Layout.minimumWidth: 100
      text: part
      color: "#ccc"
      font.pixelSize: 20
    }
    Rectangle {
      Layout.fillWidth: true
      height: 40
      border.color: "#ccc"
      color: "#333"
      clip: true

      TextInput {
        id: performerName
        text: ""
        width: parent.width - 40
        y: (parent.height - height) / 2
        x: 20
        color: "#cccccc"
      }
    }

  }
}
