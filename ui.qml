import QtQuick 2.4
import QtQuick.Layouts 1.2
import QtQuick.Controls 1.4


RowLayout {
  id: layout
  anchors.fill: parent
  spacing: 0

  SideBar{}

  StackView {
      Layout.fillWidth: true
      Layout.minimumWidth: 400
      Layout.fillHeight: true

      id: mainStackView

      SearchView{}

  }

}
