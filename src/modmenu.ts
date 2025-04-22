
interface IModMenu {
    Menu: Java.Wrapper;
    Config: Java.Wrapper;
    Bool: Java.Wrapper;
    Int: Java.Wrapper;
    String: Java.Wrapper;
}

function getColor(color: string): number {
    return Java.use('android.graphics.Color').parseColor(color);
}

export function getModMenu(): IModMenu {
    const Menu = Java.use('com.maars.fmenu.Menu');
    const Config = Java.use('com.maars.fmenu.Config');
    const Bool = Java.use('com.maars.fmenu.PBoolean');
    const Int = Java.use('com.maars.fmenu.PInteger');
    const String = Java.use('com.maars.fmenu.PString');
    return { Menu, Config, Bool, Int, String };
}

interface MenuConfigFields {
    // color fields
    MENU_BG_COLOR: string;
    BTN_OFF_BG_COLOR: string;
    BTN_ON_BG_COLOR: string;
    CHECKBOX_COLOR: string;
    COLLAPSE_BG_COLOR: string;
    MENU_BUTTON_BG_COLOR: string;
    MENU_CATEGORY_BG_COLOR: string;
    MENU_FEATURE_BG_COLOR: string;
    NUMBER_TEXT_COLOR: string;
    RADIO_BUTTON_COLOR: string;
    SEEKBAR_COLOR: string;
    SEEKBAR_NUMBER_NEG_COLOR: string;
    SEEKBAR_NUMBER_POS_COLOR: string;
    SEEKBAR_PROGRESS_COLOR: string;
    TEXT_COLOR_PRIMARY: string;
    TEXT_COLOR_SECONDARY: string;
    // string fields
    MENU_TITLE: string;
    MENU_SUBTITLE: string;
    MENU_HIDE_BUTTON_TEXT: string;
    MENU_CLOSE_BUTTON_TEXT: string;
    MENU_LAUNCHER_ICON: string;
    // number fields
    MENU_WIDTH: number;
    MENU_HEIGHT: number;
    MENU_COLLAPSED_ALPHA: number;
    MENU_LAUNCHER_ICON_SIZE: number;
}

export class MenuConfig implements MenuConfigFields {
    private _config: Java.Wrapper;

    MENU_BG_COLOR!: string;
    BTN_OFF_BG_COLOR!: string;
    BTN_ON_BG_COLOR!: string;
    CHECKBOX_COLOR!: string;
    COLLAPSE_BG_COLOR!: string;
    MENU_BUTTON_BG_COLOR!: string;
    MENU_CATEGORY_BG_COLOR!: string;
    MENU_FEATURE_BG_COLOR!: string;
    NUMBER_TEXT_COLOR!: string;
    RADIO_BUTTON_COLOR!: string;
    SEEKBAR_COLOR!: string;
    SEEKBAR_NUMBER_NEG_COLOR!: string;
    SEEKBAR_NUMBER_POS_COLOR!: string;
    SEEKBAR_PROGRESS_COLOR!: string;
    TEXT_COLOR_PRIMARY!: string;
    TEXT_COLOR_SECONDARY!: string;
    MENU_TITLE!: string;
    MENU_SUBTITLE!: string;
    MENU_HIDE_BUTTON_TEXT!: string;
    MENU_CLOSE_BUTTON_TEXT!: string;
    MENU_LAUNCHER_ICON!: string;
    MENU_WIDTH!: number;
    MENU_HEIGHT!: number;
    MENU_COLLAPSED_ALPHA!: number;
    MENU_LAUNCHER_ICON_SIZE!: number;

    // Define which fields are color, string, or number
    static colorFields = [
        'MENU_BG_COLOR', 'BTN_OFF_BG_COLOR', 'BTN_ON_BG_COLOR', 'CHECKBOX_COLOR',
        'COLLAPSE_BG_COLOR', 'MENU_BUTTON_BG_COLOR', 'MENU_CATEGORY_BG_COLOR',
        'MENU_FEATURE_BG_COLOR', 'NUMBER_TEXT_COLOR', 'RADIO_BUTTON_COLOR',
        'SEEKBAR_COLOR', 'SEEKBAR_NUMBER_NEG_COLOR', 'SEEKBAR_NUMBER_POS_COLOR',
        'SEEKBAR_PROGRESS_COLOR', 'TEXT_COLOR_PRIMARY', 'TEXT_COLOR_SECONDARY'
    ] as const;

    static stringFields = [
        'MENU_TITLE', 'MENU_SUBTITLE', 'MENU_HIDE_BUTTON_TEXT', 'MENU_CLOSE_BUTTON_TEXT',
        'MENU_LAUNCHER_ICON'
    ] as const;

    static numberFields = [
        'MENU_WIDTH', 'MENU_HEIGHT', 'MENU_COLLAPSED_ALPHA', 'MENU_LAUNCHER_ICON_SIZE'
    ] as const;

    constructor() {
        const { Config } = getModMenu();
        this._config = Config.$new();
    }

    get class(): Java.Wrapper<{}> { return this._config }

    // Dynamically generate getters/setters for fields
    static defineProperties() {
        // Color fields
        for (const field of MenuConfig.colorFields) {
            Object.defineProperty(MenuConfig.prototype, field, {
                get() { return this._config[field].value; },
                set(value: string) { this._config[field].value = getColor(value); },
                enumerable: true,
                configurable: true
            });
        }
        // String fields
        for (const field of MenuConfig.stringFields) {
            Object.defineProperty(MenuConfig.prototype, field, {
                get() { return this._config[field].value; },
                set(value: string) { this._config[field].value = value; },
                enumerable: true,
                configurable: true
            });
        }
        // Number fields
        for (const field of MenuConfig.numberFields) {
            Object.defineProperty(MenuConfig.prototype, field, {
                get() { return this._config[field].value; },
                set(value: number) { this._config[field].value = value; },
                enumerable: true,
                configurable: true
            });
        }
    }
}
MenuConfig.defineProperties();

type DataType = boolean | number | string;

export class ModMenu {
    private _mainActivity: Java.Wrapper;
    private _menu: Java.Wrapper;
    private _config: MenuConfig;
    private _datamap: Record<string, Java.Wrapper> = {};

    constructor(MainActivity: Java.Wrapper) {
        this._mainActivity = MainActivity;
        this._config = new MenuConfig();
        this._menu = getModMenu().Menu.$new(this._mainActivity, this._config.class);
    }

    get class(): Java.Wrapper<{}> { return this._menu }
    get config(): MenuConfig { return this._config }
    get activity(): Java.Wrapper<{}> { return this._mainActivity }

    createMenu(): void { Java.scheduleOnMainThread(() => this._menu.attach()); }
    destroyMenu(): void { Java.scheduleOnMainThread(() => this._menu.detach()); }

    add(name: string, value: DataType): void {
        const { Bool, Int, String } = getModMenu();
        let data: Java.Wrapper | null = null;
        if (typeof value === 'boolean') data = Bool.of(value);
        else if (typeof value === 'number') data = Int.of(value);
        else if (typeof value === 'string') data = String.of(value);
        else {
            console.error(`Unsupported type for ${name}`);
            return;
        }
        this._datamap[name] = data;
    }

    get(name: string): Java.Wrapper | null {
        const value = this._datamap[name];
        if (!value) console.error(`Value ${name} not found`);
        return value || null;
    }

    set(name: string, value: DataType): void {
        const data = this._datamap[name];
        if (!data) {
            console.error(`Value ${name} not found`);
            return;
        }
        const { Bool, Int, String } = getModMenu();
        if (data.$className === Bool.class.$className ||
            data.$className === Int.class.$className ||
            data.$className === String.class.$className) {
            data.set(value);
        } else {
            console.error(`Unsupported type for ${name}`);
        }
    }

    startCollapse(title: string): void { this._menu.startCollapse(title); }
    endCollapse(): void { this._menu.endCollapse(); }

    addButton(text: string, boolean: string) { this._menu.Button(text, this._datamap[boolean]); }
    addButtonLink(text: string, url: string) { this._menu.ButtonLink(text, url); }
    addButtonOnOff(text: string, boolean: string) { this._menu.ButtonOnOff(text, this._datamap[boolean]); }
    addCategory(text: string) { this._menu.Category(text); }
    addCheckBox(text: string, boolean: string) { this._menu.CheckBox(text, this._datamap[boolean]); }
    addInputNum(text: string, integer: string) { this._menu.InputNum(text, this._datamap[integer]); }
    addInputText(text: string, stringVar: string) { this._menu.InputText(text, this._datamap[stringVar]); }
    addRadioButton(text: string, options: string[], integer: string) { this._menu.RadioButton(text, options, this._datamap[integer]); }
    addSeekBar(text: string, integer: string, min: number, max: number) { this._menu.SeekBar(text, this._datamap[integer], min, max); }
    addSwitch(text: string, boolean: string) { this._menu.Switch(text, this._datamap[boolean]); }
    addTextView(text: string) { this._menu.TextView(text); }
    addWebTextView(html: string) { this._menu.WebTextView(html); }
}
