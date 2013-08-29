import bb.cascades 1.0

Page {

    property variant nombre
    property alias descripcion: descripcion.text
    property variant precio

    titleBar: TitleBar {
        id: titulo
        title: nombre
    }
    Container {
        Container {
            topPadding: 20
            leftPadding: 20
            Label {
                id: nombre_titulo
                text: nombre
                multiline: true
                textStyle.fontSize: FontSize.XXLarge
                textStyle.color: Color.DarkGreen
            }
        }

        Container {
            topPadding: 20
            leftPadding: 20
            bottomPadding: 20
            Label {
                id: descripcion
                text: "desc"
                multiline: true
                textStyle.fontSize: FontSize.Large
                textStyle.color: Color.DarkGreen
            }
        }
        Container {
            topPadding: 20
            leftPadding: 20
            bottomPadding: topPadding
            background: Color.create("#8a0000")
            horizontalAlignment: HorizontalAlignment.Fill
            Label {
                id: precio_detalle
                text: "$" + precio
                multiline: true
                textStyle.fontSize: FontSize.XXLarge
                textStyle.color: Color.White
                horizontalAlignment: HorizontalAlignment.Center
                textStyle.fontWeight: FontWeight.W700
            }
        }
    }

}