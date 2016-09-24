import React from 'react';

const Score = (props) => {
  return (
    <div className="row score-container">
      <div className="col-xs-4 text-left">
        <h4>
          Team blue - <b className='invalid'>{props.invalid.blue}</b>
        </h4>
        <strong>Score: {props.score.blue}</strong>
      </div>
      <div className="col-xs-4 text-center">
        <h4>Aktualna pula</h4>
        <strong>{props.current_score}</strong>
      </div>
      <div className="col-xs-4 text-right">
        <h4>
          Team red - <b className='invalid'>{props.invalid.red}</b>
        </h4>
        <strong>Score: {props.score.red}</strong>
      </div>
    </div>
    )
}

export default Score
