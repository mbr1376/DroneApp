#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "dronecore.h"
#include <QObject>
int main(int argc, char *argv[])
{
    qputenv("QT_GSTREAMER_DISABLE_HW_DECODING", "1");
    qputenv("LIBVA_DRIVER_NAME", "software");
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/test/main.qml"));
    //const QUrl url = QUrl::fromLocalFile("main.qml");
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreated,
        &app,
        [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        },
        Qt::QueuedConnection);
    engine.addImportPath(":/");

    engine.load(url);
        DroneCore::instance().setBattery(100);
        DroneCore::instance().setDistance(100);
        DroneCore::instance().setLevel(10);
        DroneCore::instance().setHeading(60);
        DroneCore::instance().setSpeed(50);
       DroneCore::instance().setRtsp(QUrl(""));
        QObject::connect(&DroneCore::instance(),&DroneCore::moveFront,[](double i){
           qDebug()<< i;
       });
       QObject::connect(&DroneCore::instance(),&DroneCore::heightChange,[](double i){
           qDebug()<< i;
       });
    return app.exec();
}
