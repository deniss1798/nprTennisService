const express = require('express');
const matchLogic = require('../logic/matches/matchesLogic')

const matches = express();

/**
 * @swagger
 * /api/matches:
 *  post:
 *   summary: Создание с результатами нового матча между двумя игроками
 *   requestBody:
 *     content:
 *       application/json:
 *         schema:
 *           type: object
 *           required:
 *             - winnerNickname
 *             - losserNickname
 *           properties:
 *             winnerNickname:
 *               type: string
 *               description: Никнейм победителя
 *             losserNickname:
 *               type: string
 *               description: Никнейм проигравшего
 *   description: Создание с результатами нового матча между двумя игроками
 *   responses:
 *       200:
 *         description: Успешное создание матча
 */
matches.post('/', (req, res) => {
	if (matchLogic.createNewMatches(req.body.winnerNickname, req.body.losserNickname)) {
		res.json({msg: `Created new match winner: ${req.body.winnerNickname}, losser: ${req.body.losserNickname}`}).status(200);
	}
});

module.exports = matches;