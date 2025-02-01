#ifndef CHATVIEWMODEL_H
#define CHATVIEWMODEL_H

#include <QObject>
#include <QQmlEngine>
#include <QAbstractListModel>
#include "Domain/ChatService.h"

class ChatViewModel : public QAbstractListModel {
    Q_OBJECT
    QML_ELEMENT

public:
    explicit ChatViewModel(ChatService& chatService, QObject* parent = nullptr);

    enum Roles { SenderRole = Qt::UserRole + 1, TextRole };

    int rowCount(const QModelIndex& parent = QModelIndex()) const override;
    QVariant data(const QModelIndex& index, int role = Qt::DisplayRole) const override;
    QHash<int, QByteArray> roleNames() const override;

private:
    ChatService& m_chatService;
    QList<Message> m_messages;
};

#endif // CHATVIEWMODEL_H
