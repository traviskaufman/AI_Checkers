"""
The package for the game
"""
import util


def expand(state, turn_to_play, flag):
    """Do a Min-Max-Desicion Search. Returns a tuple containing the new
    state of the board as well as the flag
    """
    state, move, flag = min_max_decision(state, turn_to_play, flag)
    print "Move: %s" % move  # output the move given by each player

    if flag == 1:
        if turn_to_play == 1:
            print "White wins the game!"
        else:
            print "Red wins the game!"

    return (state, flag)
