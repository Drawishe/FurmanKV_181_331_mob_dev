#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "httpcontroller.h"
#include <QQmlContext>

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);

    HttpController httpcontroller;
    httpcontroller.getSiteValue();

    QQmlApplicationEngine engine;

    QQmlContext *context = engine.rootContext();
    context->setContextProperty("httpcontroller", &httpcontroller);
    const QUrl url(QStringLiteral("qrc:/main.qml"));

    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    QObject * mw = engine.rootObjects().first();
        QObject::connect (mw, SIGNAL(makeRequest()),
                          &httpcontroller, SLOT(getSiteValue()));

    return app.exec();
}
