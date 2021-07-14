# NOTICE:
#
# Application name defined in TARGET has a corresponding QML filename.
# If name defined in TARGET is changed, the following needs to be done
# to match new name:
#   - corresponding QML filename must be changed
#   - desktop icon filename must be changed
#   - desktop filename must be changed
#   - icon definition filename in desktop file must be changed
#   - translation filenames have to be changed

# The name of your application
TARGET = MyDiary

CONFIG += sailfishapp

SOURCES += src/MyDiary.cpp \
    src/datastorerd.cpp \
    src/datastorert.cpp \
    src/datastorerw.cpp \
    src/dayrecord.cpp \
    src/dayrecordlist.cpp \
    src/profile.cpp \
    src/trainingrecord.cpp \
    src/trainingrecordlist.cpp \
    src/weightlist.cpp \
    src/weightrecord.cpp

DISTFILES += qml/MyDiary.qml \
    qml/cover/CoverPage.qml \
    qml/pages/DairyEditor.qml \
    qml/pages/DairyList.qml \
    qml/pages/DairyListPage.qml \
    qml/pages/DairyViewPage.qml \
    qml/pages/FirstPage.qml \
    qml/pages/Menu.qml \
    qml/pages/ProfileEditor.qml \
    qml/pages/ProfileList.qml \
    qml/pages/ProfileViewPage.qml \
    qml/pages/SecondPage.qml \
    qml/pages/WeightEditor.qml \
    qml/pages/WeightList.qml \
    qml/pages/WeightListPage.qml \
    qml/pages/WeightViewPage.qml \
    rpm/MyDiary.changes.in \
    rpm/MyDiary.changes.run.in \
    rpm/MyDiary.spec \
    rpm/MyDiary.yaml \
    todo.md \
    translations/*.ts \
    MyDiary.desktop

SAILFISHAPP_ICONS = 86x86 108x108 128x128 172x172

# to disable building translations every time, comment out the
# following CONFIG line
CONFIG += sailfishapp_i18n

# German translation is enabled as an example. If you aren't
# planning to localize your app, remember to comment out the
# following TRANSLATIONS line. And also do not forget to
# modify the localized app name in the the .desktop file.
TRANSLATIONS += translations/MyDiary-de.ts

HEADERS += \
    src/datastorerd.h \
    src/datastorert.h \
    src/datastorerw.h \
    src/dayrecord.h \
    src/dayrecordlist.h \
    src/profile.h \
    src/trainingrecord.h \
    src/trainingrecordlist.h \
    src/weightlist.h \
    src/weightrecord.h
