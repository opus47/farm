import QtQuick 2.4
import QtQuick.Layouts 1.2
import QtQuick.Controls 1.4

import "ApiClient.js" as API

Rectangle {
  id: searchView
  color: "#333333"
  anchors.fill: parent

  ColumnLayout {
    id: frm
    spacing: 10
    width: parent.width - 20
    height: parent.height - 30
    x: 10
    y: 20

    RowLayout {
      spacing: 10
      Label {
        text: "Piece"
        color: "#cccccc"
        font.pixelSize: 20
      }
      Rectangle {
        Layout.minimumHeight: 40
        Layout.minimumWidth: 500
        Layout.fillWidth: true
        height: parent.height
        border.width: 2
        color: "#333"
        border.color: "#cccccc"
        clip: true

        TextInput {
          selectByMouse: true
          selectionColor: "#444"
          text: ""
          color: "#cccccc"
          width: parent.width - 40
          y: (parent.height - height) / 2
          x: 20

          onTextChanged: {

           API.searchPieces(text, function(result) {

             pieceFlow.children = "";

             result.forEach(function(x) {
               var tile;
               tile = Qt.createComponent("PieceTile.qml");
               tile.createObject(pieceFlow, {
                 cfirst: x.cfirst,
                 clast: x.clast,
                 title: x.title,
                 key: x.key,
                 catalog: x.catalog,
                 id: x.id
               });

             });
           
           });

          }
        }
      }
    }

    Rectangle {
      color: "#474747"
      Layout.fillWidth: true
      Layout.fillHeight: true
      Flow {
        id: pieceFlow
        width: parent.width - 20
        height: parent.height - 20
        x: 10
        y: 10
        spacing: 10
        /*
         PieceTile {
           composer: "Ludwig van Beethoven"
           title: "Kreitzer Sonata"
           key: "G Flat Minor"
           catalog: "Opus47"
         }
         PieceTile {
           composer: "Antonin Dvorak"
           title: "American Quartet"
           key: "A Major"
           catalog: "Opus 96"
         }
         */
      }
    }

  }
}
