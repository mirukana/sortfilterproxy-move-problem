#include <QApplication>
#include <QQmlEngine>
#include <QQmlContext>
#include <QQmlComponent>


int main(int argc, char *argv[]) {
    QApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QApplication app(argc, argv);

    QQmlEngine engine;
    QQmlContext *objectContext = new QQmlContext(engine.rootContext());

    QQmlComponent component(&engine, "src/Window.qml");
    component.create(objectContext);

    return app.exec();
}
