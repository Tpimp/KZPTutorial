import QtQuick 2.15
import "../../Clock/" as Wall
Item {
    id:rootItem
    anchors.fill: parent
    AnimatedImage{
        anchors.fill: parent
        source:"gamer_bunny.gif"
        speed:.8
    }
    Wall.Clock{
        rootItem.height:90
        rootItem.width:90
        anchors{
            top:parent.top
            left:parent.left
            margins:80
        }
    }

}
