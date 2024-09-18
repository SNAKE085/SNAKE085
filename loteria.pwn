new gLotteryPlayers[MAX_PLAYERS];
new gTotalPlayers = 0;
new gLotteryPrize = 5000;

CMD:loteria(playerid) {
    if (gLotteryPlayers[playerid]) {
        return SendClientMessage(playerid, -1, "Você já está participando da loteria!");
    }

    gLotteryPlayers[playerid] = 1;
    gTotalPlayers++;
    
    SendClientMessage(playerid, -1, "Você entrou na loteria!");
    SendClientMessageToAll(-1, "Um jogador entrou na loteria! A chance de ganhar aumentou!");
    
    return 1;
}

public OnGameModeInit() {
    SetTimer("SorteioLoteria", 3600000, true);
    return 1;
}

forward SorteioLoteria();
public SorteioLoteria() {
    if (gTotalPlayers == 0) {
        SendClientMessageToAll(-1, "Nenhum jogador participou da loteria dessa vez.");
        return 1;
    }

    new winner = GetRandomPlayer();
    if (winner != INVALID_PLAYER_ID) {
        GivePlayerMoney(winner, gLotteryPrize);
        SendClientMessageToAll(-1, "Parabéns ao vencedor da loteria!");
        SendClientMessage(winner, -1, "Você ganhou a loteria e recebeu seu prêmio!");
        ResetLottery();
    }

    return 1;
}

GetRandomPlayer() {
    new randomPlayer;
    do {
        randomPlayer = random(MAX_PLAYERS);
    } while (!IsPlayerConnected(randomPlayer) || !gLotteryPlayers[randomPlayer]);

    return randomPlayer;
}

ResetLottery() {
    for (new i = 0; i < MAX_PLAYERS; i++) {
        gLotteryPlayers[i] = 0;
    }
    gTotalPlayers = 0;
    return 1;
}
