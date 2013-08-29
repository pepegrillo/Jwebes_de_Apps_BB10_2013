
import bb.cascades 1.0
import org.labsquare 1.0

// Item component for the item list presenting available recipes
Container {
    id: recipeItem

    layout: DockLayout {
    }

    Container {
        horizontalAlignment: HorizontalAlignment.Center

        layout: DockLayout {
        }

        // Item background image.
        ImageView {
            imageSource: "asset:///images/item_background.png"
            preferredWidth: 1280
            preferredHeight: 173
        }

        Container {
            id: highlightContainer
            background: Color.create("#75b5d3")
            opacity: 0.0
            preferredWidth: 760
            preferredHeight: 168
            horizontalAlignment: HorizontalAlignment.Center
        }
        Container {
            layout: StackLayout {
                orientation: LayoutOrientation.LeftToRight

            }
            Container {

                preferredWidth: 250
                preferredHeight: 168
                //topPadding: 40
                horizontalAlignment: HorizontalAlignment.Fill

                layout: StackLayout {
                    orientation: LayoutOrientation.LeftToRight
                }
                WebImageView {
                    id: img
                    url: ListItemData.Imagen
                }


            } // Container

            // The Item content an image and a text
            Container {
                topPadding: 40
                leftPadding: 10
                horizontalAlignment: HorizontalAlignment.Fill

                layout: StackLayout {
                    orientation: LayoutOrientation.LeftToRight
                }


                Label {
                    // The title is bound to the data in models/recipemodel.xml title attribute.
                    text: ListItemData.Nombre
                    leftMargin: 30
                    verticalAlignment: VerticalAlignment.Center
                    textStyle.base: SystemDefaults.TextStyles.TitleText
                    textStyle.color: Color.White
                    textStyle.fontSize: FontSize.XLarge
                } // Label
            } // Container
        }
    } // Container

    // Highlight function for the highlight Container
    function setHighlight(highlighted) {
        if (highlighted) {
            highlightContainer.opacity = 0.9;
        } else {
            highlightContainer.opacity = 0.0;
        }
    }

    // Connect the onActivedChanged signal to the highlight function
    ListItem.onActivationChanged: {
        setHighlight(ListItem.active);
    }

    // Connect the onSelectedChanged signal to the highlight function
    ListItem.onSelectionChanged: {
        setHighlight(ListItem.selected);
    }
}