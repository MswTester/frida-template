export async function sleep(ms: number) {
  return new Promise(resolve => setTimeout(resolve, ms));
}

export async function getActivity(activityName: string): Promise<Java.Wrapper | null> {
    let activity: Java.Wrapper | null = null;
    Java.choose(activityName, {
        onMatch: function(instance){
            activity = instance;
        },
        onComplete: function(){}
    })
    return Promise.resolve(activity);
}

export async function ensureModuleInitialized(...modules: string[]){
    while(modules.length > 0){
        const md = modules.pop();
        if(!md) return;

        if(!Module.getBaseAddress(md)){
            console.log(`Waiting for ${md} to be loaded`);
            await sleep(500);
            modules.push(md);
        }
    }
}

export function JavaIl2cppPerform (callback: () => void): void{
    Java.perform(() => {
        Il2Cpp.perform(callback);
    });
}

export function searchJavaClass (className: string): string[] {
    let results: string[] = [];
    Java.enumerateLoadedClassesSync().forEach((cls) => {
        if(cls.match(className)){
            results.push(cls);
        }
    });
    return results;
}

export function searchJavaMethod (classWrapper: Java.Wrapper, methodName: string): string[] {
    let results: string[] = [];
    classWrapper.forEach((method) => {
        if(method.toString().match(methodName)){
            results.push(method);
        }
    });
    return results;
}