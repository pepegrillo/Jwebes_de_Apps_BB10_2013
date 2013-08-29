import bb.cascades 1.0
import org.labsquare 1.0

Page {

    id: customlist

    property alias imagen: imagenT.url
    property alias nombre: nombreT.text
    property alias descripcion: descripcionT.text
    property alias precio: precioT.text

    titleBar: TitleBar {
        title: "CustomListView"
    }

    Container {

        Container {

            horizontalAlignment: HorizontalAlignment.Fill
            background: Color.Black
            WebImageView {
                id: imagenT
                url: ""
                preferredWidth: 768
                preferredHeight: 500
            }
        }
        ScrollView {
            scrollViewProperties.scrollMode: ScrollMode.Vertical
            verticalAlignment: VerticalAlignment.Fill
            Container {
                Container {

                    horizontalAlignment: HorizontalAlignment.Fill
                    Label {
                        id: nombreT
                        text: "TITULO"
                        multiline: true
                        textStyle.fontSize: FontSize.XXLarge
                        textStyle.fontWeight: FontWeight.W600
                        textStyle.textAlign: TextAlign.Center
                        textStyle.color: Color.create("#005aa7")
                        horizontalAlignment: HorizontalAlignment.Fill
                    }
                }
                Container {

                    horizontalAlignment: HorizontalAlignment.Fill
                    Label {
                        id: descripcionT
                        text: "TITULO"
                        multiline: true
                        textStyle.fontSize: FontSize.Large
                        textStyle.fontWeight: FontWeight.W600
                        textStyle.textAlign: TextAlign.Justify
                        textStyle.color: Color.create("#3590d6")
                        horizontalAlignment: HorizontalAlignment.Fill
                    }
                }
                Container {
                    topPadding: 40
                    horizontalAlignment: HorizontalAlignment.Fill
                    layout: StackLayout {
                        orientation: LayoutOrientation.LeftToRight

                    }
                    Container {
                        preferredWidth: 200
                        preferredHeight: 200
                        background: Color.create("#00477e")
                        topPadding: 40
                        leftPadding: 75
                        Label {
                            text: "$"
                            textStyle.color: Color.White
                            textStyle.fontSize: FontSize.XXLarge
                            scaleX: 2.5
                            scaleY: 2.5
                        }
                    }
                    Container {
                        preferredWidth: 568
                        preferredHeight: 200
                        background: Color.create("#7e0300")
                        topPadding: 50
                        leftPadding: 75
                        Label {
                            id: precioT
                            text: "25.00"
                            multiline: true
                            textStyle.fontSize: FontSize.XXLarge
                            textStyle.fontWeight: FontWeight.W600
                            textStyle.textAlign: TextAlign.Justify
                            textStyle.color: Color.create("#ffffff")
                            horizontalAlignment: HorizontalAlignment.Center
                        }
                    }
                }
            }
        }

    }

}