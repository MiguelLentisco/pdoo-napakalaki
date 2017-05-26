/*
    TODO:
Limpiar el playerView/Monsterview que hay en napakalakiView
napakalakiView::currentPlayerViewKeyPressed sobra (lo añadi por error y no se quitarlo)
Ponerlo todo bonito, incluyendo monstruo, tesoros y pending bad consequnece
el Text del pending BC destroza NapakalakiView
como los cambios en PlayerView se exportan rapidamente a NapakalakiView

    BUG:
PendingBC = 1 visible - te lo equipas en vez de quitartelo, el juego explota.

    ERRORES:
discardAllTreasures tiene que funcionar
Player::MakeTreasureVisible no funciona bien (he equipado a la vez un tesoro de una mano y uno de dos manos)
*/
