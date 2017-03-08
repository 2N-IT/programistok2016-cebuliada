import './../../assets/custom.css'
import React from 'react'
import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'
import Websockets from './../websockets'
import AnswerList from './../components/AnswerList'
import InvalidAnswers from './../components/InvalidAnswers'
import TeamScore from './../components/TeamScore'
import Score from './../components/Score'
import Footer from './../components/Footer'
import Alert from 'react-s-alert'
import 'react-s-alert/dist/s-alert-default.css'
import 'react-s-alert/dist/s-alert-css-effects/slide.css'

class Game extends React.Component {

  render() {
    return (
      <div>
        <Websockets />
        <h1 className='text-center logo'> cebuliada </h1>
        <TeamScore
          invalid={this.props.invalid}
          score={this.props.score}
          team_name={this.props.team_name}
        />
        <h4 id='question-title'>{this.props.question.title}</h4>
        <div className="row">
          <InvalidAnswers invalid={this.props.invalid} team={'blue'} />
          <AnswerList answears={this.props.answers} valid_answers={this.props.valid_answers} />
          <InvalidAnswers invalid={this.props.invalid} team={'red'} />
        </div>
        <Score current_score={this.props.current_score} />
        <Footer />
        <Alert stack={{limit: 3, beep: true, timeout: 5000}} />
      </div>
    )
  }
}
const mapStateToProps = (state) => (
  {
    question: state.current_question,
    answers: state.current_answers,
    score: state.score,
    invalid: state.invalid,
    current_score: state.current_score,
    valid_answers: state.valid_answers,
    team_name: state.team_name
  }
)

export default connect(mapStateToProps)(Game)
