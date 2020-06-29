#include <QtWidgets/QApplication>
#include <QQmlApplicationEngine>
#include "httpcontroller.h"
#include "cryptocontroller.h"
#include "mailmodel.h"
#include <QQmlContext>
#include <QtCharts/QChartView>
#include <QtCharts/QBarSet>
#include <QtCharts/QLegend>
QT_CHARTS_USE_NAMESPACE

int main(int argc, char *argv[])
{
    CryptoController test;

    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QApplication app(argc, argv);

    HttpController httpcontroller;
    httpcontroller.getSiteValue();

    QQmlApplicationEngine engine;

    QQmlContext *context = engine.rootContext();
    context->setContextProperty("httpcontroller", &httpcontroller);
   context->setContextProperty("mail_model", httpcontroller.mail_model); //Перемещаемая модель, которой присваиваем имя
      context->setContextProperty("httpcontroller", &httpcontroller);
      context->setContextProperty("test", &test);
      httpcontroller.db_read();
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

        QObject::connect(engine.rootObjects().first(), SIGNAL(apirequest()),
            &httpcontroller, SLOT(apirequest()));

        QObject::connect(engine.rootObjects().first(), SIGNAL(db_read()),
            &httpcontroller, SLOT(db_read()));

            QObject::connect(engine.rootObjects().first(), SIGNAL(db_write()),
            &httpcontroller, SLOT(db_write()));

    return app.exec();
}
