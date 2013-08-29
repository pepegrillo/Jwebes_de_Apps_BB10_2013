// Default empty project template
import bb.cascades 1.0

Page {
    content: Container {
        Container {
            preferredWidth: 200
            preferredHeight: 200
            background: Color.Blue

            contextActions: [
                ActionSet {
                    title: "Action Set"
                    subtitle: "This is an action set."

                    actions: [
                        ActionItem {
                            title: "Action 1"
                        },
                        ActionItem {
                            title: "Action 2"
                        },
                        ActionItem {
                            title: "Action 3"
                        }
                    ]
                } // end of ActionSet
            ] // end of contextActions list
        } // end of blue Container
    } // end of top-level Container
}// end of Page