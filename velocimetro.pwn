new PlayerText:valocimetro[MAX_PLAYERS][5];
public OnPlayerConnect(playerid)
{
  SetTimerEx("AtualizarVelocimetro", 1000, true, "i", playerid);
	
	valocimetro[playerid][0] = CreatePlayerTextDraw(playerid, 517.293884, 354.499938, "box");
	PlayerTextDrawLetterSize(playerid, valocimetro[playerid][0], 0.000000, 5.058821);
	PlayerTextDrawTextSize(playerid, valocimetro[playerid][0], 651.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, valocimetro[playerid][0], 1);
	PlayerTextDrawColor(playerid, valocimetro[playerid][0], -1);
	PlayerTextDrawUseBox(playerid, valocimetro[playerid][0], 1);
	PlayerTextDrawBoxColor(playerid, valocimetro[playerid][0], 89);
	PlayerTextDrawSetShadow(playerid, valocimetro[playerid][0], 0);
	PlayerTextDrawBackgroundColor(playerid, valocimetro[playerid][0], 255);
	PlayerTextDrawFont(playerid, valocimetro[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, valocimetro[playerid][0], 1);

	valocimetro[playerid][1] = CreatePlayerTextDraw(playerid, 515.893798, 346.616943, "");
	PlayerTextDrawTextSize(playerid, valocimetro[playerid][1], 51.000000, 38.000000);
	PlayerTextDrawAlignment(playerid, valocimetro[playerid][1], 1);
	PlayerTextDrawColor(playerid, valocimetro[playerid][1], -113);
	PlayerTextDrawSetShadow(playerid, valocimetro[playerid][1], 0);
	PlayerTextDrawBackgroundColor(playerid, valocimetro[playerid][1], -2139062271);
	PlayerTextDrawFont(playerid, valocimetro[playerid][1], 5);
	PlayerTextDrawSetProportional(playerid, valocimetro[playerid][1], 0);
	PlayerTextDrawSetPreviewModel(playerid, valocimetro[playerid][1], 411);
	PlayerTextDrawSetPreviewRot(playerid, valocimetro[playerid][1], 0.000000, 0.000000, 289.000000, 1.030925);
	PlayerTextDrawSetPreviewVehCol(playerid, valocimetro[playerid][1], 1, 1);

	valocimetro[playerid][2] = CreatePlayerTextDraw(playerid, 515.853271, 374.916625, "infernus");
	PlayerTextDrawLetterSize(playerid, valocimetro[playerid][2], 0.251293, 1.191666);
	PlayerTextDrawAlignment(playerid, valocimetro[playerid][2], 1);
	PlayerTextDrawColor(playerid, valocimetro[playerid][2], -1);
	PlayerTextDrawSetShadow(playerid, valocimetro[playerid][2], 0);
	PlayerTextDrawBackgroundColor(playerid, valocimetro[playerid][2], 255);
	PlayerTextDrawFont(playerid, valocimetro[playerid][2], 2);
	PlayerTextDrawSetProportional(playerid, valocimetro[playerid][2], 1);

	valocimetro[playerid][3] = CreatePlayerTextDraw(playerid, 566.235107, 361.499908, "00_km");
	PlayerTextDrawLetterSize(playerid, valocimetro[playerid][3], 0.251293, 1.191666);
	PlayerTextDrawAlignment(playerid, valocimetro[playerid][3], 1);
	PlayerTextDrawColor(playerid, valocimetro[playerid][3], -1);
	PlayerTextDrawSetShadow(playerid, valocimetro[playerid][3], 0);
	PlayerTextDrawBackgroundColor(playerid, valocimetro[playerid][3], 255);
	PlayerTextDrawFont(playerid, valocimetro[playerid][3], 2);
	PlayerTextDrawSetProportional(playerid, valocimetro[playerid][3], 1);

	valocimetro[playerid][4] = CreatePlayerTextDraw(playerid, 611.565002, 360.783355, "100%");
	PlayerTextDrawLetterSize(playerid, valocimetro[playerid][4], 0.215999, 1.290832);
	PlayerTextDrawAlignment(playerid, valocimetro[playerid][4], 1);
	PlayerTextDrawColor(playerid, valocimetro[playerid][4], -1);
	PlayerTextDrawSetShadow(playerid, valocimetro[playerid][4], 0);
	PlayerTextDrawBackgroundColor(playerid, valocimetro[playerid][4], 255);
	PlayerTextDrawFont(playerid, valocimetro[playerid][4], 2);
	PlayerTextDrawSetProportional(playerid, valocimetro[playerid][4], 1);
  return 1;
}
public OnPlayerStateChange(playerid, newstate, oldstate)
{
    if (newstate == PLAYER_STATE_DRIVER || newstate == PLAYER_STATE_PASSENGER)
    {
        AtualizarVelocimetro(p);
        for(new x; x < 5; x++)
		{
		PlayerTextDrawShow(playerid, valocimetro[p][x]);
		}
    }
    else
    {
       for(new x; x < 5; x++)
		{
		PlayerTextDrawHide(playerid, valocimetro[p][x]);
		}
    }
    return 1;
}
stock AtualizarVelocimetro(playerid)
{
    // Verifica se o jogador esta em um veiculo
    if (IsPlayerInAnyVehicle(playerid))
    {
        new vehicleid = GetPlayerVehicleID(playerid);
        new model = GetVehicleModel(vehicleid);
        new nome[32], velocidade_str[32], lataria_str[32];
        // Obtém a velocidade do veiculo
        new Float:velocidadeX, Float:velocidadeY, Float:velocidadeZ;
        GetVehicleVelocity(vehicleid, velocidadeX, velocidadeY, velocidadeZ);

        // Calcula a velocidade em km/h
        new Float:speed = floatsqroot(velocidadeX * velocidadeX + velocidadeY * velocidadeY + velocidadeZ * velocidadeZ) * 180.0;

        // Define o nome do veiculo com base no modelo
        switch (model)
{
    case 400: format(nome, sizeof(nome), "Landstalker");
    case 401: format(nome, sizeof(nome), "Bravura");
    case 402: format(nome, sizeof(nome), "Buffalo");
    case 403: format(nome, sizeof(nome), "Linerunner");
    case 404: format(nome, sizeof(nome), "Perennial");
    case 405: format(nome, sizeof(nome), "Sentinel");
    case 406: format(nome, sizeof(nome), "Dumper");
    case 407: format(nome, sizeof(nome), "Firetruck");
    case 408: format(nome, sizeof(nome), "Trashmaster");
    case 409: format(nome, sizeof(nome), "Stretch");
    case 410: format(nome, sizeof(nome), "Manana");
    case 411: format(nome, sizeof(nome), "Infernus");
    case 412: format(nome, sizeof(nome), "Voodoo");
    case 413: format(nome, sizeof(nome), "Pony");
    case 414: format(nome, sizeof(nome), "Mule");
    case 415: format(nome, sizeof(nome), "Cheetah");
    case 416: format(nome, sizeof(nome), "Ambulance");
    case 417: format(nome, sizeof(nome), "Leviathan");
    case 418: format(nome, sizeof(nome), "Moonbeam");
    case 419: format(nome, sizeof(nome), "Esperanto");
    case 420: format(nome, sizeof(nome), "Taxi");
    case 421: format(nome, sizeof(nome), "Washington");
    case 422: format(nome, sizeof(nome), "Bobcat");
    case 423: format(nome, sizeof(nome), "Mr. Whoopee");
    case 424: format(nome, sizeof(nome), "BF Injection");
    case 425: format(nome, sizeof(nome), "Hunter");
    case 426: format(nome, sizeof(nome), "Premier");
    case 427: format(nome, sizeof(nome), "Enforcer");
    case 428: format(nome, sizeof(nome), "Securicar");
    case 429: format(nome, sizeof(nome), "Banshee");
    case 430: format(nome, sizeof(nome), "Predator");
    case 431: format(nome, sizeof(nome), "Bus");
    case 432: format(nome, sizeof(nome), "Rhino");
    case 433: format(nome, sizeof(nome), "Barracks");
    case 434: format(nome, sizeof(nome), "Hotknife");
    case 435: format(nome, sizeof(nome), "Artic Trailer 1");
    case 436: format(nome, sizeof(nome), "Previon");
    case 437: format(nome, sizeof(nome), "Coach");
    case 438: format(nome, sizeof(nome), "Cabbie");
    case 439: format(nome, sizeof(nome), "Stallion");
    case 440: format(nome, sizeof(nome), "Rumpo");
    case 441: format(nome, sizeof(nome), "RC Bandit");
    case 442: format(nome, sizeof(nome), "Romero");
    case 443: format(nome, sizeof(nome), "Packer");
    case 444: format(nome, sizeof(nome), "Monster");
    case 445: format(nome, sizeof(nome), "Admiral");
    case 446: format(nome, sizeof(nome), "Squalo");
    case 447: format(nome, sizeof(nome), "Seasparrow");
    case 448: format(nome, sizeof(nome), "Pizzaboy");
    case 449: format(nome, sizeof(nome), "Tram");
    case 450: format(nome, sizeof(nome), "Artic Trailer 2");
    case 451: format(nome, sizeof(nome), "Turismo");
    case 452: format(nome, sizeof(nome), "Speeder");
    case 453: format(nome, sizeof(nome), "Reefer");
    case 454: format(nome, sizeof(nome), "Tropic");
    case 455: format(nome, sizeof(nome), "Flatbed");
    case 456: format(nome, sizeof(nome), "Yankee");
    case 457: format(nome, sizeof(nome), "Caddy");
    case 458: format(nome, sizeof(nome), "Solair");
    case 459: format(nome, sizeof(nome), "Topfun Van (Berkley's RC)"); 
    case 460: format(nome, sizeof(nome), "Skimmer");
    case 461: format(nome, sizeof(nome), "PCJ-600");
    case 462: format(nome, sizeof(nome), "Faggio");
    case 463: format(nome, sizeof(nome), "Freeway");
    case 464: format(nome, sizeof(nome), "RC Baron");
    case 465: format(nome, sizeof(nome), "RC Raider");
    case 466: format(nome, sizeof(nome), "Glendale");
    case 467: format(nome, sizeof(nome), "Oceanic");
    case 468: format(nome, sizeof(nome), "Sanchez");
    case 469: format(nome, sizeof(nome), "Sparrow");
    case 470: format(nome, sizeof(nome), "Patriot");
    case 471: format(nome, sizeof(nome), "Quadbike");
    case 472: format(nome, sizeof(nome), "Coastguard");
    case 473: format(nome, sizeof(nome), "Dinghy");
    case 474: format(nome, sizeof(nome), "Hermes");
    case 475: format(nome, sizeof(nome), "Sabre");
    case 476: format(nome, sizeof(nome), "Rustler");
    case 477: format(nome, sizeof(nome), "ZR-350");
    case 478: format(nome, sizeof(nome), "Walton");
    case 479: format(nome, sizeof(nome), "Regina");
    case 480: format(nome, sizeof(nome), "Comet");
    case 481: format(nome, sizeof(nome), "BMX");
    case 482: format(nome, sizeof(nome), "Burrito");
    case 483: format(nome, sizeof(nome), "Camper");
    case 484: format(nome, sizeof(nome), "Marquis");
    case 485: format(nome, sizeof(nome), "Baggage");
    case 486: format(nome, sizeof(nome), "Dozer");
    case 487: format(nome, sizeof(nome), "Maverick");
    case 488: format(nome, sizeof(nome), "VCN Maverick");
    case 489: format(nome, sizeof(nome), "Rancher");
    case 490: format(nome, sizeof(nome), "FBIRancher");
    case 491: format(nome, sizeof(nome), "Virgo");
    case 492: format(nome, sizeof(nome), "Greenwood");
    case 493: format(nome, sizeof(nome), "Jetmax");
    case 494: format(nome, sizeof(nome), "Hotring Racer");
    case 495: format(nome, sizeof(nome), "Sandking");
    case 496: format(nome, sizeof(nome), "Blista Compact");
    case 497: format(nome, sizeof(nome), "Police Maverick");
    case 498: format(nome, sizeof(nome), "Boxville");
    case 499: format(nome, sizeof(nome), "Benson");
    case 500: format(nome, sizeof(nome), "Mesa");
    case 501: format(nome, sizeof(nome), "RC Goblin");
    case 502: format(nome, sizeof(nome), "Hotring Racer");
    case 503: format(nome, sizeof(nome), "Hotring Racer");
    case 504: format(nome, sizeof(nome), "Bloodring Banger");
    case 505: format(nome, sizeof(nome), "Rancher");
    case 506: format(nome, sizeof(nome), "Super GT");
    case 507: format(nome, sizeof(nome), "Elegant");
    case 508: format(nome, sizeof(nome), "Journey");
    case 509: format(nome, sizeof(nome), "Bike");
    case 510: format(nome, sizeof(nome), "Mountain Bike");
    case 511: format(nome, sizeof(nome), "Beagle");
    case 512: format(nome, sizeof(nome), "Cropduster");
    case 513: format(nome, sizeof(nome), "Stuntplane");
    case 514: format(nome, sizeof(nome), "Petrol Trailer");
    case 515: format(nome, sizeof(nome), "Roadtrain");
    case 516: format(nome, sizeof(nome), "Nebula");
    case 517: format(nome, sizeof(nome), "Majestic");
    case 518: format(nome, sizeof(nome), "Buccaneer");
    case 519: format(nome, sizeof(nome), "Shamal");
    case 520: format(nome, sizeof(nome), "Hydra");
    case 521: format(nome, sizeof(nome), "FCR-900");
    case 522: format(nome, sizeof(nome), "NRG-500");
    case 523: format(nome, sizeof(nome), "HPV1000");
    case 524: format(nome, sizeof(nome), "Cement Truck");
    case 525: format(nome, sizeof(nome), "Tow Truck");
    case 526: format(nome, sizeof(nome), "Fortune");
    case 527: format(nome, sizeof(nome), "Cadrona");
    case 528: format(nome, sizeof(nome), "FBI Truck");
    case 529: format(nome, sizeof(nome), "Williard");
    case 530: format(nome, sizeof(nome), "Forklift");
    case 531: format(nome, sizeof(nome), "Tractor");
    case 532: format(nome, sizeof(nome), "Combine Harvester");
    case 533: format(nome, sizeof(nome), "Feltzer");
    case 534: format(nome, sizeof(nome), "Remington");
    case 535: format(nome, sizeof(nome), "Slamvan");
    case 536: format(nome, sizeof(nome), "Blade");
    case 537: format(nome, sizeof(nome), "Freight");
    case 538: format(nome, sizeof(nome), "Brownstreak");
    case 539: format(nome, sizeof(nome), "Vortex");
    case 540: format(nome, sizeof(nome), "Vincent");
    case 541: format(nome, sizeof(nome), "Bullet");
    case 542: format(nome, sizeof(nome), "Clover");
    case 543: format(nome, sizeof(nome), "Sadler");
    case 544: format(nome, sizeof(nome), "Firetruck LA");
    case 545: format(nome, sizeof(nome), "Hustler");
    case 546: format(nome, sizeof(nome), "Intruder");
    case 547: format(nome, sizeof(nome), "Primo");
    case 548: format(nome, sizeof(nome), "Cargobob");
    case 549: format(nome, sizeof(nome), "Tampa");
    case 550: format(nome, sizeof(nome), "Sunrise");
    case 551: format(nome, sizeof(nome), "Merit");
    case 552: format(nome, sizeof(nome), "Utility Van");
    case 553: format(nome, sizeof(nome), "Nevada");
    case 554: format(nome, sizeof(nome), "Yosemite");
    case 555: format(nome, sizeof(nome), "Windsor");
    case 556: format(nome, sizeof(nome), "Monster A");
    case 557: format(nome, sizeof(nome), "Monster B");
    case 558: format(nome, sizeof(nome), "Uranus");
    case 559: format(nome, sizeof(nome), "Jester");
    case 560: format(nome, sizeof(nome), "Sultan");
    case 561: format(nome, sizeof(nome), "Stratum");
    case 562: format(nome, sizeof(nome), "Elegy");
    case 563: format(nome, sizeof(nome), "Raindance");
    case 564: format(nome, sizeof(nome), "RC Tiger");
    case 565: format(nome, sizeof(nome), "Flash");
    case 566: format(nome, sizeof(nome), "Tahoma");
    case 567: format(nome, sizeof(nome), "Savanna");
    case 568: format(nome, sizeof(nome), "Bandito");
    case 569: format(nome, sizeof(nome), "Freight Flat Trailer (Train)");
    case 570: format(nome, sizeof(nome), "Streak Trailer (Train)");
    case 571: format(nome, sizeof(nome), "Kart");
    case 572: format(nome, sizeof(nome), "Mower");
    case 573: format(nome, sizeof(nome), "Dune");
    case 574: format(nome, sizeof(nome), "Sweeper");
    case 575: format(nome, sizeof(nome), "Broadway");
    case 576: format(nome, sizeof(nome), "Tornado");
    case 577: format(nome, sizeof(nome), "AT-400");
    case 578: format(nome, sizeof(nome), "DFT-30");
    case 579: format(nome, sizeof(nome), "Huntley");
    case 580: format(nome, sizeof(nome), "Stafford");
    case 581: format(nome, sizeof(nome), "BF-400");
    case 582: format(nome, sizeof(nome), "Newsvan");
    case 583: format(nome, sizeof(nome), "Tug");
    case 584: format(nome, sizeof(nome), "Petrol Trailer");
    case 585: format(nome, sizeof(nome), "Emperor");
    case 586: format(nome, sizeof(nome), "Wayfarer");
    case 587: format(nome, sizeof(nome), "Euros");
    case 588: format(nome, sizeof(nome), "Hotdog");
    case 589: format(nome, sizeof(nome), "Club");
    case 590: format(nome, sizeof(nome), "Freight Box Trailer (Train)");
    case 591: format(nome, sizeof(nome), "Artic Trailer 3");
    case 592: format(nome, sizeof(nome), "Andromada");
    case 593: format(nome, sizeof(nome), "Dodo");
    case 594: format(nome, sizeof(nome), "RC Cam");
    case 595: format(nome, sizeof(nome), "Launch");
    case 596: format(nome, sizeof(nome), "Police LS");
    case 597: format(nome, sizeof(nome), "Police SF");
    case 598: format(nome, sizeof(nome), "Police LV");
    case 599: format(nome, sizeof(nome), "Ranger");
    case 600: format(nome, sizeof(nome), "Picador");
    case 601: format(nome, sizeof(nome), "S.W.A.T.");
    case 602: format(nome, sizeof(nome), "Alpha");
    case 603: format(nome, sizeof(nome), "Phoenix");
    case 604: format(nome, sizeof(nome), "Glendale Shit");
    case 605: format(nome, sizeof(nome), "Sadler Shit");
    case 606: format(nome, sizeof(nome), "Baggage Trailer A");
    case 607: format(nome, sizeof(nome), "Baggage Trailer B");
    case 608: format(nome, sizeof(nome), "Tug Stairs Trailer");
    case 609: format(nome, sizeof(nome), "Boxville Mission");
    case 610: format(nome, sizeof(nome), "Farm Trailer");
    case 611: format(nome, sizeof(nome), "Utility Trailer");
    default: format(nome, sizeof(nome), "Veiculo");
}


        // Atualiza o nome do veiculo no TextDraw
        PlayerTextDrawSetString(playerid, valocimetro[playerid][2], nome);

        // Formata a velocidade em km/h e atualiza no TextDraw
        format(velocidade_str, sizeof(velocidade_str), "%d_km/h", floatround(speed));
        PlayerTextDrawSetString(playerid, valocimetro[playerid][3], velocidade_str);
        PlayerTextDrawSetPreviewModel(playerid, valocimetro[playerid][1], model);

        // Obtém a saúde do veiculo e calcula a porcentagem da lataria
        new Float:health;
        GetVehicleHealth(vehicleid, health);
        new lataria = floatround(health / 10.0); // Converte a saúde para porcentagem
        format(lataria_str, sizeof(lataria_str), "%d%", lataria);
        
        // Atualiza a TextDraw de ID 5 com a porcentagem da lataria
        PlayerTextDrawSetString(playerid, valocimetro[playerid][4], lataria_str);
    }
    else
    {
        // Se o jogador nao esta em um veiculo, esconde os TextDraws
        for(new x; x < 5; x++)
        {
            PlayerTextDrawHide(playerid, valocimetro[playerid][x]);
        }
    }
    return 1;
}
