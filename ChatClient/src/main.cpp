#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "ViewModels/ChatViewModel.h"

int main(int argc, char *argv[]) {
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;
    
    ChatRepository repository;
    ChatService service(repository);
    ChatViewModel chatViewModel(service);

    engine.rootContext()->setContextProperty("chatViewModel", &chatViewModel);

    const QUrl url(QStringLiteral("qrc:/qml/Main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);
    return app.exec();
}
