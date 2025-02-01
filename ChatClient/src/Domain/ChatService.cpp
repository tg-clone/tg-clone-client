#include "Domain/ChatService.h"

ChatService::ChatService(ChatRepository& chatRepo) : m_chatRepo(chatRepo) {}

QList<Message> ChatService::getMessages() const {
    return m_chatRepo.getMessages();
}
