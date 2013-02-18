"""
Math/Misc functions used within the game.
"""


def zeros(nzeros):
    """Creates a nzeros x nzeros two-dimensional array
    (essentially a matrix)
    """
    return [[0 for _ in nzeros] for _ in nzeros]


def min_max_decision(state, turn_to_play, flag):
    """Run the minimax algorithm for the current board state,
    and return a tuple containing the list of possible states,
    the list of moves, the flag, and the jump.
    """
    # find all successors of the current state
    list_of_states, list_of_moves, flag, jump = successors(state,
                                                           turn_to_play,
                                                           flag)

    # if no successors, then game over, set flag to 1 and return
    if list_of_states == 0:
        flag = 1
        move = 0
        return (list_of_states, list_of_moves, flag, move)

    # find the max utility value for the current state
    # with zero depth
    value = max_value(
        state, float('-inf'), float('inf'), turn_to_play, flag, 0
    )

    # search one step further to find which successor can provide the above
    # max utility value, and return this step(move / action)
    for i in range(0, len(list_of_states[0][0])):
        if value == min_value(
                list_of_states[i], float('-inf'), float('inf'),
                ((turn_to_play + 1) % 2), flag, 1):

            state = list_of_states[i]
            move = list_of_moves[i]
            break  # if we find a right success with min value, skip the rest

    return (state, move, flag)
