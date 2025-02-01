#ifndef CHATREPOSITORY_H
#define CHATREPOSITORY_H

#include <QObject>
#include <QList>

struct Message {
    QString sender;
    QString text;
};

class ChatRepository : public QObject {
    Q_OBJECT
public:
    explicit ChatRepository(QObject* parent = nullptr);

    QList<Message> getMessages() const;

private:
    QList<Message> m_messages;
};

#endif // CHATREPOSITORY_H
