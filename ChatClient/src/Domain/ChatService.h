#ifndef CHATSERVICE_H
#define CHATSERVICE_H

#include "Repository/ChatRepository.h"

class ChatService {
public:
    explicit ChatService(ChatRepository& chatRepo);

    QList<Message> getMessages() const;

private:
    ChatRepository& m_chatRepo;
};

#endif //
