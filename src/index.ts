import { Color, PorterDuff$Mode, View } from './classes.js';
import { config } from './config.js';
import { sleep, getActivity, ensureModuleInitialized } from './util.js';
import 'frida-il2cpp-bridge';

const modules = config.USE_IL2CPP
	? ["libil2cpp.so", "libunity.so", "libmain.so"]
	: ["libmain.so"];

async function setupOverlayView() {
	if (!config.USE_OVERLAY) return;

	Java.registerClass({
		name: 'com.ftemp.OverlayView',
		superClass: View,
		methods: {
			$init: [{
				returnType: 'void',
				argumentTypes: ['android.content.Context'],
				implementation(context: Java.Wrapper) {
					this.$super.$init(context);
					this.setFocusable(false);
					this.setLayerType(View.LAYER_TYPE_SOFTWARE.value, null);
					this.setBackgroundColor(Color.TRANSPARENT.value);
				},
			}],
			clearCanvas: [{
				returnType: 'void',
				argumentTypes: ['android.graphics.Canvas'],
				implementation(canvas: Java.Wrapper) {
					canvas.drawColor(Color.TRANSPARENT.value, PorterDuff$Mode.CLEAR.value);
				},
			}],
		},
	});
}

async function initialize() {
	await ensureModuleInitialized(...modules);

	const activity = await getActivity(config.MAIN_ACTIVITY);
	if (!activity) {
		console.error(`Could not find activity ${config.MAIN_ACTIVITY}`);
		return;
	}

	await setupOverlayView();
	await main(activity);
}

Java.perform(() => {
	initialize().catch(console.error);
});

export default async function main(mainActivity: Java.Wrapper) {
	console.log("Activity:", mainActivity);
}