#include "mailmodel.h"
#include <QAbstractItemModel>
#include <QMap>


// TODO реализация конструктора и get-методов FriendObject простейшая, проработать самостоятельно

MailObject::MailObject(const QString &getfileid, const QString &getfilechg, const QUrl &getPhoto, const int &getfilesize)
    :   m_fileid(getfileid),
        m_filechg(getfilechg),
        m_photo(getPhoto),
        m_filesize(getfilesize)
{
 //
}


MailModel::MailModel(QObject *parent) : QAbstractListModel(parent)
{
    //пусто
}


QString MailObject::getfilename() const{ // функция для получения имени файла
    return m_fileid;
}

QString MailObject::getfilechg() const{ // функция для получения фамилии друга
    return m_filechg;
}

QUrl MailObject::getPhoto() const{ // функция для получения фото друга
    return m_photo;
}

int MailObject::getfilesize() const{ // функция для получения id друга
    return m_filesize;
}

void MailModel::addItem(const MailObject & newItem){
    // не изменяется
  // благодаря beginInsertRows() и endInsertRows() QML реагирует на изменения модели
    beginInsertRows(QModelIndex(), rowCount(), rowCount());
    m_items << newItem;
    endInsertRows();
}

int MailModel::rowCount(const QModelIndex &parent) const
{
    // не изменяется
   // метод используется ListView в QML для определения числа элементов
    Q_UNUSED(parent);
    return m_items.count();
}

QVariant MailModel::data(const QModelIndex & index,
                                int role) const
{
     // метод используется в QML для получения значения одного поля под обозначением role одного элемента модели index
    if (index.row() < 0 || (index.row() >= m_items.count()))
        return QVariant();

    // TODO дописать выгрузку своих полей под своими обозначениями

    const MailObject&itemToReturn = m_items[index.row()];
    if (role == Mailfilename)
    return itemToReturn.getfilename();
    else if (role == Mailfilechg)
    return itemToReturn.getfilechg();
    else if (role == MailPhoto)
    return itemToReturn.getPhoto();
    else if (role == Mailfilesize)
    return itemToReturn.getfilesize();

    return QVariant();
}

QHash<int, QByteArray> MailModel::roleNames() const
{
    // метод используется в QML для сопоставления полей данных со строковыми названиями
     // TODO сопоставить полям данных строковые имена
    QHash<int, QByteArray> roles;

    roles[ Mailfilename] = "file_name";
    roles[ Mailfilechg] = "file_change";
    roles[ MailPhoto] = "pic50x50";// TODO
    roles[ Mailfilesize] = "file_size";// TODO
    return roles;
}

QVariantMap MailModel::get(int idx) const
{
    // не изменяется
   // метод используется ListView в QML для получения значений полей idx-го элемента модели
    QVariantMap map;
    foreach(int k, roleNames().keys())
    {
        map[roleNames().value(k)] = data(index(idx, 0), k);
    }
    return map;
}

void MailModel::clear()
{
    beginRemoveRows(QModelIndex(), 0, rowCount()-1);
    m_items.clear();
    endRemoveRows();
}
