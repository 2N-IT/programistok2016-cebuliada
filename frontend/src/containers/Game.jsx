import './../../global/custom.css';
import React from 'react';
import { connect } from 'react-redux';
import { bindActionCreators } from 'redux'
import Websockets from './../websockets'

import Answer from './../components/Answer'
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
        <div className="container">
          <div className="row">
            <div className="col-xs-12">
              <h3>{this.props.question.title}</h3>
              <table className="table table-bordered">
                <tbody className='answers-js'>
                  {this.props.answers.map(({id, title, points}) => {
                    return (
                      <Answer
                        key={id}
                        id={id}
                        title={title}
                        points={points}
                        answerClass='valid'
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
  }
)

export default connect(mapStateToProps)(Game);
