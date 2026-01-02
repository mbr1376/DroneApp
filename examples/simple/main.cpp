#include <QGuiApplication>
#include <QQmlApplicationEngine>

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

    return app.exec();
}
