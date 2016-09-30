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

  _handleKeyPress(event) {
    console.log('test:', event.keyCode);
    if(event.keyCode == 225){
      document.getElementById('real-life').style.opacity = 1
      setTimeout( () => {
        document.getElementById('real-life').style.opacity = 0
      }, 5000)
    }
  }
  componentWillMount () {
    document.addEventListener("keydown", this._handleKeyPress, false)
  }

  componentWillUnmount () {
    document.removeEventListener("keydown", this._handleKeyPress, false)
  }

  render() {
    return (
      <div className="container">
      <Websockets />
        <h1 className='text-center logo'> cebuliada </h1>
        <Score
          invalid={this.props.invalid}
          score={this.props.score}
          current_score={this.props.current_score}
        />
        <div className="container">
          <div className="row">
            <div className="col-xs-12">
              <h3 id='question-title'>{this.props.question.title}</h3>
              <div className="row">
                <div className='col-xs-1'>
                  <InvalidAnswers invalid={this.props.invalid} team={'blue'} />
                </div>
                <div className='col-xs-10'>
                  <table className="table table-bordered text-center">
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
                <div className='col-xs-1'>
                  <InvalidAnswers invalid={this.props.invalid} team={'red'} />
                </div>
              </div>
            </div>
          </div>
        </div>
        <img className="logo" src={logo}/>

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
