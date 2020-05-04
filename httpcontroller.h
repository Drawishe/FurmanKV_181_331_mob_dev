#ifndef HTTPCONTROLLER_H
#define HTTPCONTROLLER_H
#include <QObject>
#include <QNetworkAccessManager>

class HttpController : public QObject
{
    Q_OBJECT
public:
    explicit HttpController(QObject *parent = nullptr);
    QNetworkAccessManager * nam;
public slots:
    void getSiteValue();
    void token(QString url);
signals:

    void toQML(QString reply, QString number);
    void toQML1(QString reply);
    void toQML2(QString reply);
    void toQML3(QString str1, QString str2);
    void toQML4();
};

#endif // QHTTPCONTROLLER_H

