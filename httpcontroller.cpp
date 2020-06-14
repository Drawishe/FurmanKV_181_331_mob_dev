#include "httpcontroller.h"
#include <QNetworkAccessManager>
#include <QNetworkRequest>
#include <QSslSocket>
#include <QNetworkReply>
#include <QEventLoop>
#include <QUrl>


HttpController::HttpController(QObject *parent) : QObject(parent)
{
    nam = new QNetworkAccessManager;
    //connect(nam, &QNetworkAccessManager::finished, this, &HttpController::onNetworkValue);

}

void HttpController::getSiteValue()
{
    //qDebug() << "*** slot doServerRequest() started";
    QNetworkRequest request;
    request.setUrl(QUrl("https://pokur.su/pln/rub/1/"));

    //qDebug() << request.url() << request.rawHeaderList();
    //qDebug() << QSslSocket::supportsSsl() << QSslSocket::sslLibraryBuildVersionString() << QSslSocket::sslLibraryVersionString();


    QNetworkReply * reply;
    //qDebug() << "*** before get()";



    QEventLoop evtloop;
    connect(nam, &QNetworkAccessManager::finished, &evtloop, &QEventLoop::quit);
    reply=nam->get(request);
    evtloop.exec(); //execution of the loop
    QString replystr = reply->readAll();
    QString tmp = replystr.left(100);
    int j;
       QString plncost;
       j=replystr.indexOf("Государственный флаг Польши");
       j+=40;
       for (int i = 0; i < 30; i++){
           if ((replystr[j+i]<="9" && replystr[j+i]>="0") || (replystr[j+i] == ",")){
               plncost[i] = replystr[j+i];
           }
       }
    emit toQML(QString(replystr), plncost);

}
void HttpController::token(QString url){
    QString token;
    if(url.contains("email=") || url.contains("access_token="))
    {
        if (url.contains("access_token="))
        {
            token = url.split("access_token=")[1].split("&")[0]; // записываем наш access_token в переменную
            emit toQML3(url, token);
            qDebug() << "Access Token: " << token;
        }
        else{
            emit toQML4();
            qDebug() << "No token";
        }
    }
}
