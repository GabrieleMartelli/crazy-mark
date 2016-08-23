import QtQuick 2.4
import Ubuntu.Components 1.3

Page {
    header: MarkHeader {
        title: i18n.tr("About")
    }

    Flickable {
        id: flickable
        anchors {
            top: parent.header.bottom
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }

        contentHeight: contentItem.height + contentItem.padding * 2

        Item {
            id: contentItem
            property int padding: units.dp(16)
            x: padding
            y: padding
            width: parent.width - (2 * padding)
            height: childrenRect.height

            Column {
                anchors.fill: parent
                spacing: units.gu(1)

                Label {
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "Crazy Mark"
                    fontSize: "x-large"
                }

                UbuntuShape {
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: units.dp(64)
                    height: units.dp(64)
                    source: Image {
                        source: "icon.png"
                    }
                }

                Label {
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: i18n.tr("A markdown editor for Ubuntu")
                }

                Label {
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: i18n.tr("Version %1").arg(appVersion)
                }

                Item { height: units.gu(2); width: parent.width }   // Spacer

                Label {
                    text: i18n.tr("Source code available on <a href='%1'>GitHub</a>.").arg("https://github.com/tim-sueberkrueb/crazy-mark")
                    width: parent.width
                    wrapMode: Text.WordWrap
                    linkColor: "white"
                    onLinkActivated: Qt.openUrlExternally(link);
                }

                Label {
                    text: ("This application is free software: you can redistribute it and/or modify it under the terms of" +
                           " the GNU General Public License as published by the Free Software Foundation, either version 3 of the " +
                           "License, or (at your option) any later version.<br/><br/>Copyright (C) 2016 Tim Süberkrüb<br/>")
                    width: parent.width
                    wrapMode: Text.WordWrap
                }

                Row {
                    anchors.horizontalCenter: parent.horizontalCenter
                    spacing: units.dp(8)

                    Button {
                        text: "★ %1".arg(i18n.tr("Rate"))
                        color: UbuntuColors.green
                        onClicked: {
                            Qt.openUrlExternally("scope://com.canonical.scopes.clickstore?q=Crazy Mark")
                        }
                    }

                    Button {
                        text: "🐞 %1".arg(i18n.tr("Report bug"))
                        color: UbuntuColors.orange
                        onClicked: {
                            Qt.openUrlExternally("https://github.com/tim-sueberkrueb/crazy-mark/issues/new");
                        }
                    }

                    Button {
                        text: "♥ %1".arg(i18n.tr("Contribute"))
                        color: UbuntuColors.darkAubergine
                        onClicked: {
                            Qt.openUrlExternally("https://github.com/tim-sueberkrueb/crazy-mark");
                        }
                    }
                }
            }
        }
    }
}