import QtQuick 2.0
import QtQuick.Controls 1.1



    Column {
        id: seriesColumn
        Text {
            id: seriesHeadline
            text: "Välj serie"
            font.bold: true
            font.pointSize: 16
        }
        TableView {
            id: seriesListView
            width: 310
            height: 620

            TableViewColumn {
                id: serieNameColumn
                role: "serieNameShow"
                title: "Serie"
                width: 200
                movable: false
                resizable: false
            }
            TableViewColumn {
                id: countryColumn
                role: "country"
                title: "Land"
                width: 100
                movable: false
                resizable: false
            }
            model: seriesModel
            onClicked: {
                series=seriesList[seriesListView.currentRow];
                getSeriesDetail();
            }
        }
    }

