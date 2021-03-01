import React from 'react';
import { Provider, ReactReduxContext } from 'react-redux';
import { ConnectedRouter } from 'connected-react-router';
import { Route, Switch } from 'react-router-dom';
import store from './store/create';
import history from './store/history';

const Home = () => {
  return (
    <div>
      <h1>Rails - react - router - redux</h1>
    </div>
  );
};

const App = () => {
  return (
    <Provider store={store} context={ReactReduxContext}>
      <ConnectedRouter history={history} context={ReactReduxContext}>
        <Switch>
          <Route path="/" component={Home} exact />
        </Switch>
      </ConnectedRouter>
    </Provider>
  );
};

export default App;
