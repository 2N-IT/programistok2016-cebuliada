import React from 'react';

const InvalidAnswers = (props) => {
  const {invalid, team} = props
  const invalidAnswers = invalid['red'] + invalid['blue'] >= 4 ? 3 : invalid[team]

  return (
    <ul className="invalid-answers">
      {
        [...Array(invalidAnswers)].map((e, i) => <li key={i}>x</li>)
      }
    </ul>
    )
}

export default InvalidAnswers
