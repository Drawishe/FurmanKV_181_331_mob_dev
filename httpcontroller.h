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

signals:

    void toQML(QString reply, QString number);
};

#endif // QHTTPCONTROLLER_H

