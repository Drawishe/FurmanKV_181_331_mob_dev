#ifndef MAILMODEL_H
#define MAILMODEL_H
#include <QObject>
#include <QAbstractItemModel>
#include<QAbstractListModel>
#include <QList>
#include <QModelIndex>
#include <QVariant>
#include <QUrl>
#include <QVariant>

class MailObject
{
public:

    MailObject(const QString &p_userid,
                const QString &p_textp,
                const QUrl &p_photo,
                const int &p_commentscount);
    //
    QString getfilename() const;
    QString getfilechg() const;
    QUrl getPhoto() const;
    int getfilesize() const;
    // прочие get-методы для выдачи ID, URL фотографии и др.
 private:
    QString m_fileid;
    QString m_filechg;
    QUrl m_photo;
    int m_filesize;
    // прочие свойства для хранения ID, URL фотографии и др.
};

class MailModel : public QAbstractListModel
{
    Q_OBJECT
public:
    enum enmRoles {
        Mailfilename = Qt::UserRole + 1,
         Mailfilechg,
         MailPhoto,
         Mailfilesize
    };
    MailModel(QObject *parent = nullptr);

    void addItem(const MailObject & newItem);

    int rowCount(const QModelIndex & parent = QModelIndex()) const;

    QVariant data(const QModelIndex & index, int role = Qt::DisplayRole) const; // возвращает по индексу переменную (импользуется в ЛР 8)

    QVariantMap get(int idx) const;

    void clear();

 protected:
    QHash<int, QByteArray> roleNames() const;
    // ключ - значение
    // нужен, чтобы строковые имена приводить в соответствие к полям френда

 private:

   QList<MailObject> m_items;

};

#endif // MAILMODEL_H
