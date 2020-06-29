#include "httpcontroller.h"
#include <QNetworkAccessManager>
#include <QNetworkRequest>
#include <QSslSocket>
#include <QNetworkReply>
#include <QEventLoop>
#include <QUrl>
#include "mailmodel.h"

#include <QCoreApplication>
#include <QString>
#include <QByteArray>
#include <QtGlobal>
#include <QJsonArray>
#include <QJsonDocument>
#include <QJsonObject>
#include <QtSql/QSqlDatabase>
#include <QtSql/QSqlQuery>
#include <QtSql/QSqlTableModel>

HttpController::HttpController(QObject *parent) : QObject(parent)
{
    nam = new QNetworkAccessManager;
    mail_model = new MailModel();
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
    if(url.contains("error=") || url.contains("access_token="))
    {
        if (url.contains("access_token="))
        {
            token1 = url.split("access_token=")[1].split("&")[0]; // записываем наш access_token в переменную
            emit toQML3(url, token1);
            qDebug() << "Access Token: " << token1;
        }
        else{
            emit toQML4();
            qDebug() << "No token";
        }
    }
}

void HttpController::apirequest(){

    QEventLoop loop;
    nam = new QNetworkAccessManager();
    QObject::connect(nam, // связываем loop  с нашим менеджером
                     SIGNAL(finished(QNetworkReply*)),
                     &loop,
                     SLOT(quit()));
    m_accessToken = token1.toUtf8();
    qDebug() << "Наш токен API: " << m_accessToken;
    qDebug() << "Наш хеш API: "; //<< sigMd5;

    QNetworkRequest request;
    request.setUrl(QUrl("https://cloud-api.yandex.net/v1/disk/resources/last-uploaded?limit=20&media_type=image,font,web,development&preview_size=S"));
    request.setRawHeader("Authorization" , " OAuth " + m_accessToken );

    QNetworkReply *reply = nam->get(request);
    loop.exec();
    qDebug() << reply;

    QJsonDocument document = QJsonDocument::fromJson(reply->readAll());
    qDebug() << document;

    QJsonObject root = document.object();
    //qDebug() <<"Наш root"<< root;

    QJsonValue itog = root.value("items");
     //qDebug() <<"Value API"<< itog;

     QJsonArray smth = itog.toArray();
      //qDebug()<<"Массив" << smth;
     int png=0, jpeg=0, ttf=0, css=0, other=0;

      for(int i = 0; i < smth.count(); i++){

              QJsonObject znach = smth.at(i).toObject();
      //       // Забираем значения свойств имени
               QString fileid = znach.value("name").toString();
               //qDebug() << fileid;

      //       // Забираем значения свойств последнего изменения
               QString filechg = znach.value("mime_type").toString();
              //qDebug() << filechg;

      //       // Забираем значения размера файла
               int filesize = znach.value("size").toInt();
               //qDebug() << filesize;


      //       // Забираем ссылку на файл
               QUrl photo = znach.value("file").toString();
               //qDebug() << photo;
               if(filechg == "image/png" && filesize != 0 ) png ++;
                       else if (filechg == "image/jpeg" && filesize != 0 ) jpeg ++;
                       else if (filechg == "font/ttf" && filesize != 0 ) ttf ++;
                       else if (filechg == "text/plain" && filesize != 0 ) css ++;
                       else   other ++;


            mail_model->addItem(MailObject (fileid, filechg, photo, filesize ));
             qDebug()<<"mail model" << mail_model->Mailfilename;
              qDebug() << mail_model->Mailfilechg;
             qDebug() << mail_model->MailPhoto;
             qDebug() << mail_model->Mailfilesize;


         }
      emit toQML9(png, jpeg, ttf, css, other);



}

bool HttpController::db_read(){ // функция для чтения получившейся БД


    if (mail_model->rowCount() > 0) {
        mail_model->clear();
    }

    QSqlDatabase db = QSqlDatabase::addDatabase("QSQLITE");
    db.setHostName("DataBase");
    db.setDatabaseName("D:/Mobdev/lab6.db"); // название таблицы

    db.open();                            // используется для отображения в QML


    QSqlQuery query;

    if (query.exec("SELECT * FROM lab6") == true ){
        query.exec("SELECT * FROM lab6");
        while (query.next()) {
            int filesize = query.value(0).toInt();
            QString fileid = query.value(1).toString();
            QString filechg = query.value(2).toString();
            QUrl photo = query.value(3).toUrl();

            qDebug() << filesize << fileid << filechg  << photo;

            mail_model->addItem(MailObject(fileid,filechg,photo, filesize));

          }
            db.close();

            //qDebug() << "Успешно";
            return 1;
    }
    else {
        QString errore = "В Базе Данных отсутсвуют данные";
        //qDebug() << errore;

        return 0;
    }

        return 0;

}

void HttpController::db_write(){

    QEventLoop loop;
    nam = new QNetworkAccessManager();
    QObject::connect(nam, // связываем loop  с нашим менеджером
                     SIGNAL(finished(QNetworkReply*)),
                     &loop,
                     SLOT(quit()));
    m_accessToken = token1.toUtf8();
//    qDebug() << "Наш токен API: " << m_accessToken;

    QNetworkRequest request;
    request.setUrl(QUrl("https://cloud-api.yandex.net/v1/disk/resources/last-uploaded?limit=20&media_type=image,font,web,development&preview_size=S"));
    request.setRawHeader("Authorization" , " OAuth " + m_accessToken );

    QNetworkReply *reply = nam->get(request);
    loop.exec();
//    qDebug() << reply;

    QJsonDocument document = QJsonDocument::fromJson(reply->readAll());
//    qDebug() << document;

    QJsonObject root = document.object();
    //qDebug() <<"Наш root"<< root;

    QJsonValue itog = root.value("items");
//     qDebug() <<"Value API"<< itog;

     QJsonArray smth = itog.toArray();
//     qDebug()<<"Массив" << smth;

     // открытие БД
          QSqlDatabase db = QSqlDatabase::addDatabase("QSQLITE");
          db.setHostName("DataBase");
          db.setDatabaseName("D:/Mobdev/lab6.db"); // название таблицы

          db.open();

          QSqlQuery query;
          query.exec("DROP TABLE lab6");
          query.exec("CREATE TABLE lab6(" // создаем таблицу friends
                          "Mail_Size int,"
                          "MailTitle varchar(255),"
                          "MailFileChg varchar(255),"
                          "MailPhoto varchar(255))");

          if (mail_model->rowCount() > 0) {
              mail_model->clear();
          }



          for(int i = 0; i < smth.count(); i++){

                  QJsonObject znach = smth.at(i).toObject();
          //       // Забираем значения свойств имени файла
                   QString fileid = znach.value("name").toString();
                   qDebug() << fileid;

          //       // Забираем значения свойств даты изменения
                   QString filechg = znach.value("mime_type").toString();
                  qDebug() << filechg;

          //       // Забираем значения размера файла
                   int filesize = znach.value("size").toInt();
                   qDebug() << filesize;


          //       // Забираем ссылку на файл
                   QUrl photo = znach.value("file").toString();
                   qDebug() << photo;


                   query.prepare("INSERT INTO lab6(Mail_Size, MailTitle, MailFileChg, MailPhoto)"
                                        "VALUES (:Mail_Size, :MailTitle, :MailFileChg, :MailPhoto)");

                          query.bindValue(":Mail_Size", filesize);
                          query.bindValue(":MailTitle", fileid);
                          query.bindValue(":MailFileChg", filechg);
                          query.bindValue(":MailPhoto", photo);
                          query.exec();
          }

          QSqlDatabase::removeDatabase("QSQLITE");
               db.close();


}
