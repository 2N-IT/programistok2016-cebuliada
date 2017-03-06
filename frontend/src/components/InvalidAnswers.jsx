import React from 'react';

const InvalidAnswers = (props) => {
  const {invalid, team} = props
  const invalidAnswers = invalid['red'] + invalid['blue'] >= 4 ? 3 : invalid[team]

  return (
    <div className='col-xs-1'>
      <ul className="invalid-answers">
        {
          [...Array(invalidAnswers)].map((e, i) => <li key={i}>x</li>)
        }
      </ul>
    </div>
    )
}

export default InvalidAnswers
