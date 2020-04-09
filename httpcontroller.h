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
    void toQML(QString reply);
};

#endif // QHTTPCONTROLLER_H

