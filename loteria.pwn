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
        format(str, sizeof(str), "Parabéns %s, você ganhou a loteria e recebeu %i de prêmio!", GetPlayerName(winner), gLotteryPrize);
        SendClientMessageToAll(-1, str);
        ResetLottery();
    }

    return 1;
}

GetRandomPlayer() {
    if (gTotalPlayers == 0) {
        return INVALID_PLAYER_ID;
    }

    new randomPlayer;
    for (new i = 0; i < 100; i++) {
        randomPlayer = random(MAX_PLAYERS);
        if (IsPlayerConnected(randomPlayer) && gLotteryPlayers[randomPlayer]) {
            return randomPlayer;
        }
    }
    return INVALID_PLAYER_ID;
}

ResetLottery() {
    for (new i = 0; i < MAX_PLAYERS; i++) {
        gLotteryPlayers[i] = 0;
    }
    gTotalPlayers = 0;
    return 1;
}
