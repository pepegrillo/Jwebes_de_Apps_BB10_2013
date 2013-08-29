import bb.cascades 1.0
import bb.data 1.0
import bb.system 1.0

Page {

    titleBar: TitleBar {
        title: "StandardListItem Imagen"
    }

    content: Container {
        layout: DockLayout {

        }
        ActivityIndicator {
            id: dataLoadIndicator
            preferredWidth: 400
            preferredHeight: 400
            horizontalAlignment: HorizontalAlignment.Center
            verticalAlignment: VerticalAlignment.Center
        }
        ListView {
            id: listViewDemo

            dataModel: // Add a data model that sorts based on the name property
            GroupDataModel {
                id: groupDataModel
                sortingKeys: [ "Nombre" ]
            }

            /*dataModel: GroupDataModel {
             * grouping: ItemGrouping.None
             * }*/

            listItemComponents: [
                ListItemComponent {
                    type: "item"
                    StandardListItem {
                        title: ListItemData.Nombre
                        description: ListItemData.Descripcion
                        status: ListItemData.Precio
                        imageSpaceReserved: true
                        imageSource: "asset:///images/ic_info.png"

                    }
                }
            ]

            onTriggered: {
                var chosenItem = dataModel.data(indexPath);

                var Detalle = detalle_page.createObject();
                Detalle.nombre = chosenItem.Nombre;
                Detalle.descripcion = chosenItem.Descripcion;
                Detalle.precio = chosenItem.Precio;

                navegar.push(Detalle);
            }
        }
    }

    attachedObjects: [
        DataSource {
            id: serviceDataSource
            source: "http://www.buzzcoapp.com/admin2/webServices/metodosWSJSON.php?opt=1"
            type: DataSourceType.Json
            onDataLoaded: {
                listViewDemo.dataModel.clear();
                listViewDemo.dataModel.insertList(data)
                dataLoadIndicator.stop();
            }
            onError: {
                dataLoadIndicator.stop();
                myQmlDialog.show();
            }
        },
        // System dialog displayed when the feed can not be shown.
        SystemDialog {
            id: myQmlDialog
            title: "¡Algo malo ha pasado!"
            body: "Se ha producido un error desafortunado con la descarga de los datos, verifique su conexión a Internet"
        },
        ComponentDefinition {
            id: detalle_page
            source: "ListView_Detail.qml"
        }
    ]

    onCreationCompleted: {
        serviceDataSource.load();
        dataLoadIndicator.start();
    }
}