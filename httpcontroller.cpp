#include "httpcontroller.h"
#include <QNetworkRequest>
#include <QSslSocket>
#include <QNetworkReply>
#include <QEventLoop>

HttpController::HttpController(QObject *parent) : QObject(parent)
{
    nam = new QNetworkAccessManager;

}

void HttpController::getSiteValue()
{
    //qDebug() << "*** slot doServerRequest() started";
    QNetworkRequest request;
    request.setUrl(QUrl("https://music.yandex.ru/"));

    //qDebug() << request.url() << request.rawHeaderList();
    //qDebug() << QSslSocket::supportsSsl() << QSslSocket::sslLibraryBuildVersionString() << QSslSocket::sslLibraryVersionString();


    QNetworkReply * reply;
    //qDebug() << "*** before get()";



    QEventLoop evtloop;
    connect(nam, &QNetworkAccessManager::finished, &evtloop, &QEventLoop::quit);
    reply=nam->get(request);
    evtloop.exec(); //execution of the loop
    QByteArray replystr = reply->readAll();
    QByteArray tmp = replystr.left(100);
    emit toQML(QString(replystr));
}

