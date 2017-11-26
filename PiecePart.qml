import QtQuick 2.4
import QtQuick.Layouts 1.2
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

import "ApiClient.js" as API

Item {
  property string part
  property var musicians

  Layout.minimumHeight: 40
  Layout.fillWidth: true

  Component.onCompleted: {

    //API.getMusicians(function(musicians) {

      musicians.forEach(function(x) {
        //if there is no middle name, then there is no property ... be defensive
        if (!('middle' in x)) {
          x['middle'] = ""
        }
        musicianModel.append({ 
          text: x.first + ' ' + x.middle + ' ' + x.last,
          mid: x.id //use an id so things like spelling error don't creep in
        });
      });

    //});

  }

  RowLayout {

    anchors.fill: parent
    Label {
      Layout.minimumWidth: 100
      text: part
      color: "#ccc"
      font.pixelSize: 20
    }
    /*
    Rectangle {
      Layout.fillWidth: true
      height: 40
      border.color: "#ccc"
      color: "#333"
      clip: true
      */

      /*
      TextInput {
        activeFocusOnTab: true
        KeyNavigation.priority: KeyNavigation.BeforeItem
        selectByMouse: true
        id: performerName
        text: ""
        width: parent.width - 40
        y: (parent.height - height) / 2
        x: 20
        color: "#cccccc"
      }
      */
      ComboBox {
        Layout.fillWidth: true
        editable: true
        model: ListModel {
          id: musicianModel
          ListElement { text: "" }
        }
        onAccepted: {
          if (find(editText) === -1) {
            model.append({text: editText})
          }
        }
        style: ComboBoxStyle {
          textColor: "#ccc"
          //font.pointSize: 12
          selectionColor: "#444"
          background: Rectangle {
            color: "#333"
          }
          __editor: Rectangle {
            color: "#333"
          }
          dropDownButtonWidth: 0
          label: Text {
            color: "#ccc"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            text: control.editText
          }
        }
      }
    //}

  }
}
