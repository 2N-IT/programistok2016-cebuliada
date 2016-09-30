import * as Actions from './constants'

export function setActiveQuestion (question, answers) {
  return { type: Actions.SET_ACTIVE_QUESTION, question, answers }
}
export function clearInvalidAnswers () {
  return { type: Actions.CLEAR_INVALID_ANSWERS }
}
export function addValidAnswer (answerId, points) {
  return { type: Actions.ADD_VALID_ANSWER, answerId, points }
}
export function addInvalidAnswer (team) {
  return { type: Actions.ADD_INVALID_ANSWER, team }
}
export function assignPoints(team, points) {
  return { type: Actions.ASSIGN_POINTS, team, points }
}
export function changeName(team, value) {
  return { type: Actions.CHANGE_NAME, team, value }
}
