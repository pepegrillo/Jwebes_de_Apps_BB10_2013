import bb.cascades 1.0
import bb.data 1.0
import bb.system 1.0

Page {

    titleBar: TitleBar {
        title: "CustomListView"
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
            id: myListView

            // Associate the list view with the data model that's defined in the
            // attachedObjects list
            dataModel: dataModel

            listItemComponents: [
                ListItemComponent {
                    type: "item"
                    CustomListView {

                    }
                }
            ]
            onTriggered: {
                var chosenItem = dataModel.data(indexPath);

                var Detalle = detalle_page.createObject();
                Detalle.imagen = chosenItem.Imagen;
                Detalle.nombre = chosenItem.Nombre;
                Detalle.descripcion = chosenItem.Descripcion;
                Detalle.precio = chosenItem.Precio;

                navegar.push(Detalle);
            }
        }
    }

    attachedObjects: [
        GroupDataModel {
            id: dataModel

            // Sort the data in the data model by the "pubDate" field, in
            // descending order, without any automatic grouping
            sortingKeys: [ "Nombre" ]
            sortedAscending: true
            grouping: ItemGrouping.None
        },
        DataSource {
            id: dataSource

            // Load the XML data from a remote data source, specifying that the
            // "item" data items should be loaded
            source: "http://www.buzzcoapp.com/admin2/webServices/metodosWSJSON.php?opt=1"
            //query: "/rss/channel/item"
            type: DataSourceType.Json

            onDataLoaded: {
                // After the data is loaded, clear any existing items in the data
                // model and populate it with the new data
                dataModel.clear();
                dataModel.insertList(data)
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
            source: "ListView3_Detail.qml"
        }

    ]

    onCreationCompleted: {
        // When the top-level Page is created, direct the data source to start
        // loading data
        dataSource.load();
        dataLoadIndicator.start();
    }
}