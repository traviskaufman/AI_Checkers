"""
Unit Tests for the Checkers Game. Checks different scenarios.
"""

import unittest
from json import load as json_load
import checkers
from checkers import util
from checkers.game_globals import RED_TO_PLAY, BLACK_TO_PLAY


SCENARIOS = json_load("fixtures/scenarios.json")


class TestScenarios(unittest.TestCase):
    """Unit Tests for Checkers Game"""
    board = None

    def setUp(self):
        """Set the flag to zero and clear the board"""
        self.flag = 0
        self.board = util.zeros(8)  # clear the board

    def test_scenario_1(self):
        """jump forward is obliged and no jump backwards for regular
        pieces
        """
        expected_state_round_1 = [
            [0, 0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 1, 0, 0],
            [0, 0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0, 0],
            [0, 1, 0, 1, 0, 0, 0, 0],
            [2, 0, 0, 0, 0, 0, 0, 0]
        ]

        expected_flag_round_1 = 0

        expected_state_round_2 = [
            [0, 0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 1, 0, 0],
            [0, 0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0, 0],
            [0, 0, 2, 0, 0, 0, 0, 0],
            [0, 0, 0, 1, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0, 0]
        ]

        expected_flag_round_2 = 0
        self._test_scenario(1, expected_state_round_1, expected_flag_round_1,
                            expected_state_round_2, expected_flag_round_2)

    def test_scenario_2(self):
        """king promotion and checking the game ended by lack of pieces
        (no move)
        """
        expected_state_round_1 = [
            [0, 0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 1, 0, 0],
            [0, 0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0, 0],
            [0, 0, 3, 0, 0, 0, 0, 0]
        ]

        expected_flag_round_1 = 0

        expected_state_round_2 = [
            [0, 0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 1, 0, 0],
            [0, 0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0, 0],
            [0, 0, 3, 0, 0, 0, 0, 0]
        ]

        expected_flag_round_2 = 1
        self._test_scenario(2, expected_state_round_1, expected_flag_round_1,
                            expected_state_round_2, expected_flag_round_2)

    def test_scenario_3(self):
        """king promotion and checking the game ended by lack of pieces
        (no move)
        """
        expected_state_round_1 = [
            [0, 0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 1, 0, 0],
            [0, 0, 0, 0, 0, 0, 1, 0],
            [0, 0, 0, 0, 0, 0, 0, 2],
            [0, 0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0, 0],
            [0, 0, 3, 0, 0, 0, 0, 0]
        ]

        expected_flag_round_1 = 0

        expected_state_round_2 = [
            [0, 0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 1, 0, 0],
            [0, 0, 0, 0, 0, 0, 1, 0],
            [0, 0, 0, 0, 0, 0, 0, 2],
            [0, 0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0, 0],
            [0, 0, 3, 0, 0, 0, 0, 0]
        ]

        expected_flag_round_2 = 1
        self._test_scenario(3, expected_state_round_1, expected_flag_round_1,
                            expected_state_round_2, expected_flag_round_2)

    def test_scenario_4(self):
        """king promotion and checking the game ended by lack of pieces
        (no move)
        """
        expected_state_round_1 = [
            [0, 0, 0, 0, 0, 0, 0, 4],
            [0, 0, 0, 0, 1, 0, 1, 0],
            [0, 0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 2, 0, 0, 0, 0],
            [3, 0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0, 0]
        ]

        expected_flag_round_1 = 0

        expected_state_round_2 = [
            [0, 0, 0, 4, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 2, 0, 0, 0, 0],
            [3, 0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0, 0]
        ]

        expected_flag_round_2 = 1
        self._test_scenario(4, expected_state_round_1, expected_flag_round_1,
                            expected_state_round_2, expected_flag_round_2)

    def init_board_with_scenario(self, scenario):
        """
        Given an array of dictionaries that each representing a scenario
        (an array of pieces on a board), initialize the game board with the
        give pieces.
        """
        for piece in scenario:
            self.board[piece['row']][piece['column']] = piece['color']

    def _test_scenario(
            self, scenario_number, expected_board_round_1,
            expected_flag_round_1, expected_board_round_2,
            expected_flag_round_2):
        """
        Given a scenario number and expected output after each round, make
        sure each scenario is working correctly by running assertions
        against it.
        """
        self.board = self.init_board_with_scenario(scenario_number)

        self.board, self.flag = checkers.expand(self.board,
                                                RED_TO_PLAY,
                                                self.flag)
        self.assertEqual(expected_board_round_1, self.board)
        self.assertEqual(expected_flag_round_1, self.flag)

        self.board, self.flag = checkers.expand(self.board,
                                                BLACK_TO_PLAY,
                                                self.flag)
        self.assertEqual(expected_board_round_2, self.board)
        self.assertEqual(expected_flag_round_2, self.flag)


if __name__ == "__main__":
    unittest.main()
