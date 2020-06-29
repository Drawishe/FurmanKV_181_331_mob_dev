#ifndef HTTPCONTROLLER_H
#define HTTPCONTROLLER_H
#include <QObject>
#include <QNetworkAccessManager>
#include "mailmodel.h"



class HttpController : public QObject
{
    Q_OBJECT
public:
    explicit HttpController(QObject *parent = nullptr);
    QNetworkAccessManager * nam;
    MailModel *mail_model;
    QByteArray m_accessToken;
    QString token1;


public slots:
    void getSiteValue();
    void token(QString url);
    void apirequest();
    void db_write();
    bool db_read();

signals:
    void toQML(QString reply, QString number);
    void toQML1(QString reply);
    void toQML2(QString reply);
    void toQML3(QString str1, QString str2);
    void toQML4();
    void toQML9(int png, int jpeg, int ttf, int css,int  other);
protected:
    QObject *showHttp;
};

#endif // QHTTPCONTROLLER_H

