/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow
 */

import React, {Component} from 'react';

import {
  StyleSheet,
  Text,
  TextInput,
  NativeModules,
  View,
  Button,
  Alert,
} from 'react-native';

export default class App extends Component {
  constructor(props) {
    super(props);
    this.state = {text: ''};
  }
  render() {
    return (
      <View style={styles.container}>
        <Text>Payment details</Text>
        <TextInput
          style={{margin: 10}}
          multiline={true}
          placeholder="Type amount to pay"
          onChangeText={text => this.setState({text})}
        />
        <Button
          onPress={() => {
            NativeModules.Payhere.callbackMethod((err, r) => console.log(r));
          }}
          title="Call Payhere"
          color="#841584"
          accessibilityLabel="Initiate a Payment Request to PayHere Payment Gateway "
        />
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#F5FCFF',
  },
});
