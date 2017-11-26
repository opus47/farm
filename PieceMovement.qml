import QtQuick 2.4
import QtQuick.Layouts 1.2
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

Item {
  property int num
  property string title
  property var tracks: []

  Layout.minimumHeight: 40
  Layout.fillWidth: true

  RowLayout {
    anchors.fill: parent
    Label {
      Layout.fillWidth: true
      text: num + ". " + title
      color: "#ccc"
      font.pixelSize: 18
    }

    ComboBox {
      Layout.minimumWidth: 100
      model: tracks
      style: ComboBoxStyle {
        background: Rectangle {
          color: "#333"
          border.color: "#ccc"
          border.width: 1
        }
        dropDownButtonWidth: 10
        label: Text {
          color: "#ccc"
          verticalAlignment: Text.AlignVCenter
          horizontalAlignment: Text.AlignHCenter
          text: control.currentText
        }
      }
    }
  }


}
