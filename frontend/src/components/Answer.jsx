import React from 'react';

const Answer = (props) => {
  const answerClass = props.validAnswers.includes(props.id) ? 'valid' : ''
  return (
    <tr
      id={`answer-${props.id}`}
      className={answerClass}
    >
      <td>{props.index}</td>
      <td className='text-left'>{props.title}</td>
      <td>{props.points}</td>
    </tr>
  )
}

export default Answer
