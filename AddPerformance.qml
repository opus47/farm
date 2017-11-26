import QtQuick 2.4
import QtQuick.Layouts 1.2
import QtQuick.Controls 1.4

Item {
  property string cfirst
  property string clast
  property string title
  property string key
  property string catalog
  property var movements

  id: addPerf
  
  anchors.fill: parent

  Component.onCompleted: {

    movements.forEach(function(m) {

      console.log(JSON.stringify(m));
      var ctor = Qt.createComponent("PieceMovement.qml");
      ctor.createObject(pieceMovements, {
        title: m.title,
        num: m.number,
        tracks: [
          "Track 1",
          "Track 2",
          "Track 3",
          "Track 4"
        ]
      });

    });

  }

  Rectangle {
    color: "#333333"
    width: parent.width - 20
    height: parent.height - 20
    x: 10
    y: 10

    ColumnLayout {
      anchors.fill: parent

      Rectangle {
        Layout.minimumHeight: 50
        Layout.fillWidth: true
        color: "#333"
        RowLayout {
          width: parent.width - 20
          height: parent.height - 20
          x: 10
          y: 10
          spacing: 10
          Label {
            anchors.verticalCenter: parent.verticalCenter
            text: "<"
            color: "#ccc"
            font.pixelSize: 20

            MouseArea {
              anchors.fill: parent
              hoverEnabled: true
              onEntered: {
                parent.color = "#1c5d99";
              }
              onExited: {
                parent.color = "#ccc";
              }
              onClicked: {
                console.log("back click");
                mainStackView.clear();
              }
            }
          }
          Label {
            anchors.verticalCenter: parent.verticalCenter
            Layout.fillWidth: true
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenter: parent.horizontalCenter
            text: clast + ": " + title + " in " + key + " ~ " + catalog
            color: "#ccc"
            font.pixelSize: 20
          }
        }
      }

      Rectangle {
        color: "#474747"
        Layout.fillWidth: true
        Layout.fillHeight: true

        ColumnLayout {
          spacing: 40
          width: parent.width - 20
          x: 10
          y: 10

          RowLayout {
            spacing: 10
            Layout.fillWidth: true
            Label {
              text: "Performance"
              font.pixelSize: 20
              color: "#ccc"
            }
            Rectangle {
              Layout.fillWidth: true
              height: 40
              border.color: "#ccc"
              color: "#333"
              clip: true

              TextInput {
                text: ""
                width: parent.width - 40
                y: (parent.height - height) / 2
                x: 20
                color: "#cccccc"
              }
            }
          }

          ColumnLayout {
            id: pieceMovements
            Layout.fillWidth: true

            /*
            PieceMovement {
              Layout.fillWidth: true
              num: 1
              title: "Allegro von ploppo"
              tracks: [
                "Track 1",
                "Track 2",
                "Track 3",
                "Track 4"
              ]
            }

            PieceMovement {
              Layout.fillWidth: true
              num: 2
              title: "Kersplopo non sancho"
              tracks: [
                "Track 1",
                "Track 2",
                "Track 3",
                "Track 4"
              ]
            }
            */

          }

        }
      }

    }
  }
}
