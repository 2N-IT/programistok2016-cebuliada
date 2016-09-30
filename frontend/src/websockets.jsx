import React from 'react';
import ActionCable from 'actioncable';
import { connect } from 'react-redux';
import { bindActionCreators } from 'redux'
import * as Actions from './constants'
import Alert from 'react-s-alert';

import {
  setActiveQuestion,
  addValidAnswer,
  addInvalidAnswer,
  clearInvalidAnswers,
  assignPoints,
  changeName
} from './game_actions'

class Websockets extends React.Component {
  constructor(props) {
    super(props);
    window._this = this
    this.performAction = this.performAction.bind(this)
  }

  componentDidMount() {
    const cable = ActionCable.createConsumer('ws://localhost:3000/cable');
    cable.subscriptions.create('ProgramistokChannel',  {
      connected() {
        console.log('connected:');
      },
      received: (data) => {
        console.log('received:', data);
        this.performAction(data)
      },
    });
  }

  shortlyHideQuestionTitle (){
    document.getElementById('question-title').style.opacity = '0'
  }

  addCustomNotification(content) {
    Alert.info(content, { html: true });
  }

  showAllAnswers() {
    let answers = document.getElementsByClassName('answers')[0].childNodes
    answers.forEach((answer) => answer.className += ' valid')
  }

  showSuprise() {
    const elem = document.getElementById('real-life')
    if (elem.style.opacity == 1)
      elem.style.opacity = 0
    else {
      elem.style.opacity = 1
    }
  }

  performAction = (data) => {
    switch (data.action) {
      case Actions.SET_ACTIVE_QUESTION:
        return (
          this.props.setActiveQuestion(data.question, data.answers),
          this.shortlyHideQuestionTitle()
        )
      case Actions.ADD_VALID_ANSWER:
        return this.props.addValidAnswer(data.answerId, data.points)
      case Actions.ADD_INVALID_ANSWER:
        return this.props.addInvalidAnswer(data.team)
      case Actions.CLEAR_INVALID_ANSWERS:
        return this.props.clearInvalidAnswers()
      case Actions.ASSIGN_POINTS:
        return this.props.assignPoints(data.team, data.points)
      case Actions.CHANGE_NAME:
        return this.props.changeName(data.team, data.value)
      case 'ADD_CUSTOM_NOTIFICATION':
        return this.addCustomNotification(data.content)
      case 'SHOW_ALL_ANSWERS':
        return this.showAllAnswers()
      case 'HIDE_INTRO':
        return document.getElementById('intro').style.opacity = 0
      case 'SHOW_SUPRISE':
        return this.showSuprise()
      case 'SHOW_QUESTION_TITLE':
        return document.getElementById('question-title').style.opacity = '1'
      default:
        return console.log('invalid action from controller', data.type);
   }
  }

  render() {
    return false
  }
}

const mapDispatchToProps = (dispatch) => {
  return bindActionCreators({
   setActiveQuestion,
   addValidAnswer,
   addInvalidAnswer,
   clearInvalidAnswers,
   assignPoints,
   changeName
 }, dispatch)
}
export default connect(null, mapDispatchToProps)(Websockets);
