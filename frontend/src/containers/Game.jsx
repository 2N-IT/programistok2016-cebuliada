import './../../global/custom.css';
import React from 'react';
import { connect } from 'react-redux';
import { bindActionCreators } from 'redux'
import Websockets from './../websockets'

import Answer from './../components/Answer'
import Score from './../components/Score'

import Alert from 'react-s-alert';
import 'react-s-alert/dist/s-alert-default.css';
import 'react-s-alert/dist/s-alert-css-effects/slide.css';

class Game extends React.Component {

  render() {
    return (
      <div className="container">
      <Websockets />
        <img className="logo" src="http://programistok.org/images/programistok.png"/>
        <h1 className='text-center'> Familiada </h1>
        <Score
          invalid={this.props.invalid}
          score={this.props.score}
          current_score={this.props.current_score}
        />
        <div className="container">
          <div className="row">
            <div className="col-xs-12">
              <h3 id='question-title'>{this.props.question.title}</h3>
              <table className="table table-bordered">
                <tbody className='answers-js'>
                  {this.props.answers.map(({id, title, points}) => {
                    return (
                      <Answer
                        key={id}
                        id={id}
                        title={title}
                        points={points}
                        validAnswers={this.props.valid_answers}
                      />
                      )
                  })}
                </tbody>
              </table>
            </div>
          </div>
        </div>
        <Alert stack={{limit: 3, beep: true}} />
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
    valid_answers: state.valid_answers
  }
)

export default connect(mapStateToProps)(Game);
