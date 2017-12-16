import { StackNavigator } from 'react-navigation';
import Root from 'AwesomeProject/pages/root.js';
import About from 'AwesomeProject/pages/about.js';

const RootNavigator = StackNavigator({
	Root: {
		screen: Root,
	},
	About: {
		screen: About,
	}
});

export default RootNavigator;