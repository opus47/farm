import QtQuick 2.4
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
      spacing: 10
      width: parent.width - 20
      x: 10
      y: 20

      RowLayout {
        spacing: 10
         Label {
           text: "Piece"
           color: "#cccccc"
         }
         Rectangle {
          Layout.fillWidth: true
          Layout.minimumHeight: 40
          Layout.minimumWidth: 500
          border.width: 2
          color: "#333"
          border.color: "#cccccc"
          clip: true

          TextInput {
            text: ""
            color: "#cccccc"
            width: parent.width - 40
            y: (parent.height - height) / 2
            x: 20

            onTextChanged: {

              console.log("search string ",text)

              var req = new XMLHttpRequest();
              req.onreadystatechange = function() {

                if(req.readyState == XMLHttpRequest.DONE) {
                  console.log("search response", req.statusText)
                }
              }
              req.open("GET", "https://opus47.io/pieces/search?text="+text);
              req.send();

            }
          }
        }
      }
    }
  }

}
