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
      height: parent.height - 30
      x: 10
      y: 20

      RowLayout {
        spacing: 10
        Label {
          text: "Piece"
          color: "#cccccc"
        }
        ColumnLayout {
          Layout.fillWidth: true
          Layout.minimumHeight: 40
          Layout.minimumWidth: 500
          Rectangle {
            width: parent.width
            height: parent.height
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

                var etext = encodeURI(text);
                console.log("search string ", text)

                var req = new XMLHttpRequest();
                req.onreadystatechange = function() {
                pieceFlow.children = "";

                  if(req.readyState == XMLHttpRequest.DONE) {
                    var js = JSON.parse(req.response);
                    js.forEach(function(x) {


                      console.log("~");
                      console.log("Composer: ", x.composer);
                      console.log("Title: ", x.title);
                      console.log("Key: ", x.key);


                      var tile;
                      tile = Qt.createComponent("PieceTile.qml");
                      tile.createObject(pieceFlow, {
                        composer: x.composer,
                        title: x.title,
                        key: x.key,
                        catalog: x.catalog
                      });
                      




                    })
                  }
                }
                req.open("GET", "https://opus47.io/pieces/search?text="+etext);
                req.send();

              }
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
        }
      }

    }
  }

}
