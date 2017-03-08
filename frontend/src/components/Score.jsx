import React from 'react';

const Score = (props) => {

  return (
    <div className='row'>
      <div className="text-center pull-right">
        <strong>Suma: {props.current_score}</strong>
      </div>
    </div>
  )
}

export default Score
