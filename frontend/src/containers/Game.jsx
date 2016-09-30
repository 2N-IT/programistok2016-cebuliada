import './../../global/custom.css';
import React from 'react';
import { connect } from 'react-redux';
import { bindActionCreators } from 'redux'
import Websockets from './../websockets'
import logo from './logo.png'
import Answer from './../components/Answer'
import InvalidAnswers from './../components/InvalidAnswers'
import Score from './../components/Score'

import Alert from 'react-s-alert';
import 'react-s-alert/dist/s-alert-default.css';
import 'react-s-alert/dist/s-alert-css-effects/slide.css';

class Game extends React.Component {

  render() {
    return (
      <div>
        <Websockets />
        <h1 className='text-center logo'> cebuliada </h1>
        <Score
          invalid={this.props.invalid}
          score={this.props.score}
          current_score={this.props.current_score}
          team_name={this.props.team_name}
        />
        <h3 id='question-title'>{this.props.question.title}</h3>
        <div className="row">
          <div className='col-xs-1'>
            <InvalidAnswers invalid={this.props.invalid} team={'blue'} />
          </div>
          <div className='col-xs-10 answers-list'>
            <table className="table table-bordered text-center">
              <tbody className='answers'>
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
          <div className='col-xs-1'>
            <InvalidAnswers invalid={this.props.invalid} team={'red'} />
          </div>
        </div>
        <img className="footer" src={logo}/>

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
    valid_answers: state.valid_answers,
    team_name: state.team_name
  }
)

export default connect(mapStateToProps)(Game);
