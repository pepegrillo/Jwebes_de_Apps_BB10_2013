// Default empty project template
import bb.cascades 1.0

// creates one page with a label
NavigationPane {

    id: navegar

    Menu.definition: MenuDefinition {

        actions: [
            ActionItem {
                title: "Info"
                imageSource: "asset:///images/ic_info.png"
                onTriggered: {
                    var Jwebes = jwebes_page.createObject();
                    navegar.push(Jwebes);
                }
            }
        ]
    }

    Page {

        titleBar: TitleBar {
            title: "Jwebes de Apps"
        }

        Container {
            layout: DockLayout {
            }
            Container {
                topPadding: 20
                horizontalAlignment: HorizontalAlignment.Center
                SegmentedControl {
                    Option {
                        id: option1
                        text: "Español"
                        selected: true
                    }
                    Option {
                        id: option2
                        text: "English"
                    }
                    onSelectedOptionChanged: {
                        // Use an if statement to change the text style of the
                        // Label based on the selection option
                        if (selectedOption == option1) {
                            hello.text = "Hola Mundo";
                        } else if (selectedOption == option2) {
                            hello.text = "Hello World";
                        }
                    }
                }
            }

            Label {
                id: hello
                text: "Hola Mundo"
                textStyle.base: SystemDefaults.TextStyles.BigText
                verticalAlignment: VerticalAlignment.Center
                horizontalAlignment: HorizontalAlignment.Center
            }
        }

        actions: [
            ActionItem {
                title: "Sorpresa"
                ActionBar.placement: ActionBarPlacement.OnBar

                onTriggered: {

                }
                imageSource: "asset:///images/ic_select.png"
            },
            ActionItem {
                title: "StandarList Texto"
                ActionBar.placement: ActionBarPlacement.InOverflow
                imageSource: "asset:///images/ic_select.png"

                onTriggered: {
                    var List = list_page.createObject();
                    navegar.push(List);
                }
            },
            ActionItem {
                title: "StandarList Imagen"
                ActionBar.placement: ActionBarPlacement.InOverflow
                imageSource: "asset:///images/ic_select.png"

                onTriggered: {
                    var List2 = list2_page.createObject();
                    navegar.push(List2);
                }
            },
            ActionItem {
                title: "CustomList"
                ActionBar.placement: ActionBarPlacement.InOverflow
                imageSource: "asset:///images/ic_select.png"

                onTriggered: {
                    var ListCustom = listc_page.createObject();
                    navegar.push(ListCustom);
                    //myLabel.text = "Action 2 selected!"
                }
            }
        ]
    }
    attachedObjects: [
        ComponentDefinition {
            id: list_page
            source: "ListView.qml"
        },
        ComponentDefinition {
            id: list2_page
            source: "ListView2.qml"
        },
        ComponentDefinition {
            id: listc_page
            source: "ListView3.qml"
        },
        ComponentDefinition {
            id: jwebes_page
            source: "Jwebes.qml"
        },
        ListView3_Detail{
            id: customlist
        }
    ]

    
}
