#include "Repository/ChatRepository.h"

ChatRepository::ChatRepository(QObject* parent) : QObject(parent) {
    // Добавляем тестовые сообщения
    m_messages.append(Message{"Alice", "Hi there!"});
    m_messages.append(Message{"Me", "Fuck off!"});
    m_messages.append(Message{"Alice", "How are you?"});
}

QList<Message> ChatRepository::getMessages() const {
    return m_messages;
}

