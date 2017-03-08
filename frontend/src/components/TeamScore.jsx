import React from 'react';

const TeamScore = (props) => {

  return (
    <div className="row score-container">
      <div className="col-xs-5 text-left">
        <strong>{props.team_name.blue}: {props.score.blue}</strong>
      </div>
      <div className="col-xs-2"></div>
      <div className="col-xs-5 text-right">
        <strong>{props.team_name.red}: {props.score.red}</strong>
      </div>
    </div>
  )
}

export default TeamScore
