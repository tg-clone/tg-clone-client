cmake_minimum_required(VERSION 3.22)
project(ChatClient VERSION 1.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Включение генерации метаданных и MOC
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)

# Подключение Conan Toolchain
include(${CMAKE_BINARY_DIR}/conan_toolchain.cmake)

# Подключение Qt
find_package(Qt6 REQUIRED COMPONENTS Core Gui Qml Quick)

# Рекурсивно находим все .cpp файлы в папке src
file(GLOB_RECURSE SOURCES src/*.cpp)

# Указываем, что src/ является корневой директорией для инклудов
include_directories(src)

# Добавление ресурса
qt_add_resources(RESOURCES qml.qrc)

# Создание исполняемого файла
qt_add_executable(${PROJECT_NAME} ${SOURCES} ${RESOURCES})

# Подключение библиотек
target_link_libraries(${PROJECT_NAME} PRIVATE Qt6::Core Qt6::Gui Qt6::Qml Qt6::Quick)
