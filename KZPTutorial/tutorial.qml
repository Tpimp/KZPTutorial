import QtQuick 2.15
import "../../Clock/" as Wall
Item {
    id:rootItem
    anchors.fill: parent
    state:""
    Connections{
        target: AppController
        function onDraw(){
            rootItem.state = clock.minutes % 2 == 0 ? "bunny":"penguin"
        }
    }
    states:[
        State{
            extend:""
            name:"bunny"
            PropertyChanges{
                target:penguin
                opacity:0
            }
            PropertyChanges{
                target:bunny
                opacity:1
            }
            PropertyChanges{
                target:clock
                x:84
                y:70
                rootItem.height:90
                rootItem.width:90
            }
        },
        State {
            extend:"" // start with bunny state
            name:"penguin" // used to set the state, rootItem.state = "penguin"
            PropertyChanges{
                target:penguin
                opacity:1
            }
            PropertyChanges{
                target:bunny
                opacity:0
            }
            PropertyChanges{
                target:clock
                x:220
                y:76
                rootItem.height:140
                rootItem.width:140
            }
        }
    ]
    AnimatedImage{
        id: penguin
        anchors.fill: parent
        source:"game_penguin.gif"
        speed:.8
        opacity:0
        Behavior on opacity {
            NumberAnimation{duration:2500}
        }
    }
    AnimatedImage{
        id:bunny
        anchors.fill: parent
        source:"gamer_bunny.gif"
        speed:.8
        opacity:1
        Behavior on opacity {
            NumberAnimation{duration:2500}
        }
    }

    Wall.Clock{
        id:clock
        rootItem.height:90
        rootItem.width:90
        x: 84
        y: 70
        Behavior on rootItem.height {
            NumberAnimation{duration:1500}
        }
        Behavior on rootItem.width {
            NumberAnimation{duration:1500}
        }
        Behavior on x {
            NumberAnimation {duration:2000}
        }
        Behavior on y {
            NumberAnimation {duration:2000}
        }
    }
}
