import QtQuick 2.5
import QtQuick.Layouts 1.2
import QtQuick.Controls 1.4

RowLayout {
  id: layout
  anchors.fill: parent
  spacing: 0

  Rectangle {
    color: "#36435b"
    Layout.minimumWidth: 75
    Layout.fillHeight: true

    ColumnLayout {
      id: nav

      spacing: 0
      property var current: cd

      Rectangle {
        id: cd
        Layout.minimumWidth: 75
        Layout.minimumHeight: 75
        color: "#333333"

        MouseArea {
          anchors.fill: parent
          onClicked: {
            cd.color = "#333333"
            nav.current.color = "#36435b"
            nav.current = cd
          }
        }

        Image {
          source: "img/cd.png"
          height: 65
          fillMode: Image.PreserveAspectFit
          x: (parent.width - width) / 2
          y: (parent.height - height) / 2
        }
      }

      Rectangle {
        id: score
        Layout.minimumWidth: 75
        Layout.minimumHeight: 75
        color: "#36435b"

        MouseArea {
          anchors.fill: parent
          onClicked: {
            score.color = "#333333"
            nav.current.color = "#36435b"
            nav.current = score
          }
        }
        
        Image {
          source: "img/cleff.png"
          height: 65
          fillMode: Image.PreserveAspectFit
          x: (parent.width - width) / 2
          y: (parent.height - height) / 2
        }

      }

    }

  }

  Rectangle {
    color: "#333333"
    Layout.fillWidth: true
    Layout.minimumWidth: 400
    Layout.fillHeight: true

    ColumnLayout {
      id: frm
      spacing: 0

      RowLayout {
         Label {
           text: "Piece"
           color: "#cccccc"
         }
         TextInput {
           text: "..."
           color: "#cccccc"
         }
      }
    }
  }

}
