import 'frida-il2cpp-bridge';
import { sleep, getActivity, ensureModuleInitialized, JavaIl2cppPerform, searchJavaClass, searchJavaMethod } from './util.js';

const APP_MAIN_ACTIVITY = 'com.nianticproject.holoholo.libholoholo.unity.UnityMainActivity';

const modules = ["libil2cpp.so", "libunity.so", "libmain.so"];

JavaIl2cppPerform(async () => {
	await sleep(1000);
	await ensureModuleInitialized(...modules);

	const activity = await getActivity(APP_MAIN_ACTIVITY);
	if (!activity) {
		console.error(`Could not find activity ${APP_MAIN_ACTIVITY}`);
		return;
	}

	main(activity).catch(console.error);
});

async function main(mainActivity: Java.Wrapper) {
	console.log("Activity:", mainActivity);
}