#include <QGuiApplication>
#include <QtQuick/QQuickView>
#include <QSslConfiguration>
#include <QSslSocket>

int main(int argc, char **argv) {

  QSslConfiguration config = QSslConfiguration::defaultConfiguration();
  config.setPeerVerifyMode(QSslSocket::VerifyNone);
  QSslConfiguration::setDefaultConfiguration(config);

  QGuiApplication app(argc, argv);
  QQuickView view;
  view.setResizeMode(QQuickView::SizeRootObjectToView);
  view.setSource(QUrl("qrc:///ui.qml"));
  view.show();

  return app.exec();

}
