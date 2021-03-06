#include "game.h"

struct Game_t
{
    int id_player1;
    int id_player2;
    Winner winner;
    int game_time;
    bool auto_win;
};

//Construction & destruction:
Game createGame(int id_player1, int id_player2, Winner winner, int game_time, ChessResult* error)
{
   *error = CHESS_SUCCESS;

   if(id_player1 == id_player2 || id_player1 <= 0 || id_player2 <= 0)
   {
       *error = CHESS_INVALID_ID;
   }
   else if(game_time < 0)
   {
       *error = CHESS_INVALID_PLAY_TIME;
   }


   if(*error != CHESS_SUCCESS)
   {
       return NULL;
   }

   Game game = malloc(sizeof(*game));
   if (game == NULL)
   {
        *error = CHESS_OUT_OF_MEMORY;    
        return NULL;
   }

    game->id_player1 = id_player1;
    game->id_player2 = id_player2;
    game->winner = winner;
    game->game_time = game_time;
    game->auto_win = false;

    return game;
}
               
void freeGame(Game game)
{
    free(game);
}

//Getters & Setters:
int getPlayer1Id(Game game)
{
    return game->id_player1;
}
int getPlayer2Id(Game game)
{
    return game->id_player2;
}

bool didPlayerForfeit(Game game, int player_id)
{
    if (!isPlayerForfeited(game) || (getPlayer1Id(game) != player_id && getPlayer2Id(game) != player_id))
    {
        return false;
    }

    Winner winner = getWinner(game);
    return (winner == DRAW //Both players forfeited.
            || getWinnerId(game) != player_id); //Player forfeited.
}

Winner getWinner(Game game)
{
    return game->winner;
}

int getWinnerId(Game game)
{
    if (game->winner == DRAW)
    {
        return NO_WINNER;
    }
    return game->winner == FIRST_PLAYER ? getPlayer1Id(game) : getPlayer2Id(game);
}

int getPlayerPlayTime(Game game, int player_id)
{
    if (!didPlayerPlay(game, player_id))
    {
        return 0;
    }

    return getTime(game);
}

bool isPlayerForfeited(Game game)
{
    return game->auto_win;
}

void setPlayerForfeited(Game game, int player_to_remove_id, Map players)
{
    assert(didPlayerPlay(game, player_to_remove_id));

    if (isPlayerForfeited(game)) //Both players removed.
    {
        game->winner = DRAW;
    }
    else if (player_to_remove_id == getPlayer1Id(game))
    {
        if (game->winner == FIRST_PLAYER)
        {
            int id2 = getPlayer2Id(game);
            Player player2 = mapGet(players, &id2);
            assert(player2 != NULL);
            increaseWins(player2);
            decreaseLosses(player2);
        }
        game->winner = SECOND_PLAYER;
    }
    else
    {
        if (game->winner == SECOND_PLAYER)
        {
            int id1 = getPlayer1Id(game);
            Player player1 = mapGet(players, &id1);
            assert(player1 != NULL);
            increaseWins(player1);
            decreaseLosses(player1);
        }
        game->winner = FIRST_PLAYER;        
    }

    game->auto_win = true;
}

int getTime(Game game)
{
    return game->game_time;
}


//additional functions:
Game copyGame(Game src)
{
    if(!src)
    {
        return NULL;
    }

    Game copy = malloc(sizeof(*copy));
    if(copy==NULL)
    {
        return NULL;
    }

    copy->game_time = src->game_time;
    copy->id_player1 = src->id_player1;
    copy->id_player2 = src->id_player2;
    copy->winner = src->winner;
    copy->auto_win = src->auto_win;

    return copy;
}

bool didPlayerPlay(Game game, int player_id)
{
    return
        ((!isPlayerForfeited(game) && (getPlayer1Id(game) == player_id || getPlayer2Id(game) == player_id))
        || (isPlayerForfeited(game) && getWinnerId(game) == player_id));
}

//Map-related functions:
MapDataElement mapGameCopy(MapDataElement game)
{
    return copyGame((Game)game);
}

MapKeyElement mapGameIdCopy(MapKeyElement id)
{
    int *new = malloc(sizeof(int));
    if (new == NULL)
    {
        return NULL;
    }
    *new = *((int*)id);
    return new;
}

void mapGameDataFree(MapDataElement game)
{
    freeGame((Game)game);
}

void mapGameIdFree(MapKeyElement gameId)
{
    free((int*)gameId);
}

int mapGameKeyCompare(MapKeyElement id1, MapKeyElement id2)
{
    return (*((int*)id1) - *((int*)id2));
}
