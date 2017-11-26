import QtQuick 2.4
import QtQuick.Layouts 1.2

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
