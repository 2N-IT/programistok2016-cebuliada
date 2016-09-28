import React from 'react';

const Score = (props) => {
  return (
    <div className="row score-container">
      <div className="col-xs-4 text-left">
        <strong>TEAM1: {props.score.blue}</strong>
      </div>
      <div className="col-xs-4 text-center">
        <strong>{props.current_score}</strong>
      </div>
      <div className="col-xs-4 text-right">
        <strong>TEAM2: {props.score.red}</strong>
      </div>
    </div>
    )
}

export default Score
