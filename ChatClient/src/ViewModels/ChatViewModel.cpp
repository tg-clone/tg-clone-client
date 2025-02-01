#include "ChatViewModel.h"

ChatViewModel::ChatViewModel(ChatService& chatService, QObject* parent)
    : QAbstractListModel(parent), m_chatService(chatService) {
    m_messages = m_chatService.getMessages();
}

int ChatViewModel::rowCount(const QModelIndex& parent) const {
    Q_UNUSED(parent);
    return m_messages.size();
}

QVariant ChatViewModel::data(const QModelIndex& index, int role) const {
    if (!index.isValid() || index.row() >= m_messages.size()) {
        return QVariant();
    }

    const Message& message = m_messages.at(index.row());

    switch (role) {
        case SenderRole:
            return message.sender;
        case TextRole:
            return message.text;
        default:
            return QVariant();
    }
}

QHash<int, QByteArray> ChatViewModel::roleNames() const {
    return { {SenderRole, "sender"}, {TextRole, "text"} };
}
