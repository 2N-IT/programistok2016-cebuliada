import React from 'react';
import { render } from 'react-dom';
import Game from './containers/Game'
import { createStore } from 'redux'
import { Provider } from 'react-redux'
import gameReducer from './game_reducer'

const store = createStore(gameReducer, window.devToolsExtension && window.devToolsExtension())

render((
  <Provider store={store}>
    <Game />
  </Provider>
), document.getElementById('app'))
