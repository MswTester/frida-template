.class public Lcom/maars/fmenu/MainActivity;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "MainActivity.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 9
    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    return-void
.end method

.method private TestMenu()V
    .locals 17

    .line 22
    move-object/from16 v0, p0

    new-instance v1, Lcom/maars/fmenu/Menu;

    invoke-direct {v1, v0}, Lcom/maars/fmenu/Menu;-><init>(Landroid/content/Context;)V

    .line 23
    .local v1, "menu":Lcom/maars/fmenu/Menu;
    invoke-virtual {v1}, Lcom/maars/fmenu/Menu;->attach()V

    .line 25
    const-string v2, "Category 1"

    invoke-virtual {v1, v2}, Lcom/maars/fmenu/Menu;->Category(Ljava/lang/String;)V

    .line 26
    const/4 v8, 0x0

    invoke-static {v8}, Lcom/maars/fmenu/PInteger;->of(I)Lcom/maars/fmenu/PInteger;

    move-result-object v2

    const-string v3, "InputNum 1"

    invoke-virtual {v1, v3, v2}, Lcom/maars/fmenu/Menu;->InputNum(Ljava/lang/String;Lcom/maars/fmenu/PInteger;)V

    .line 27
    const-string v2, "Hello World"

    invoke-static {v2}, Lcom/maars/fmenu/PString;->of(Ljava/lang/String;)Lcom/maars/fmenu/PString;

    move-result-object v2

    const-string v3, "InputText 1"

    invoke-virtual {v1, v3, v2}, Lcom/maars/fmenu/Menu;->InputText(Ljava/lang/String;Lcom/maars/fmenu/PString;)V

    .line 28
    const-string v2, "Button 1"

    invoke-static {v8}, Lcom/maars/fmenu/PBoolean;->of(Z)Lcom/maars/fmenu/PBoolean;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/maars/fmenu/Menu;->Button(Ljava/lang/String;Lcom/maars/fmenu/PBoolean;)V

    .line 29
    const-string v2, "CheckBox 1"

    invoke-static {v8}, Lcom/maars/fmenu/PBoolean;->of(Z)Lcom/maars/fmenu/PBoolean;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/maars/fmenu/Menu;->CheckBox(Ljava/lang/String;Lcom/maars/fmenu/PBoolean;)V

    .line 30
    invoke-static {v8}, Lcom/maars/fmenu/PBoolean;->of(Z)Lcom/maars/fmenu/PBoolean;

    move-result-object v2

    const-string v9, "Switch 1"

    invoke-virtual {v1, v9, v2}, Lcom/maars/fmenu/Menu;->Switch(Ljava/lang/String;Lcom/maars/fmenu/PBoolean;)V

    .line 31
    const-string v2, "Button 2"

    invoke-static {v8}, Lcom/maars/fmenu/PBoolean;->of(Z)Lcom/maars/fmenu/PBoolean;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/maars/fmenu/Menu;->ButtonOnOff(Ljava/lang/String;Lcom/maars/fmenu/PBoolean;)V

    .line 32
    const-string v3, "SeekBar 1"

    invoke-static {v8}, Lcom/maars/fmenu/PInteger;->of(I)Lcom/maars/fmenu/PInteger;

    move-result-object v4

    const/4 v5, 0x0

    const/16 v6, 0x64

    const/4 v7, 0x5

    move-object v2, v1

    invoke-virtual/range {v2 .. v7}, Lcom/maars/fmenu/Menu;->SeekBar(Ljava/lang/String;Lcom/maars/fmenu/PInteger;III)V

    .line 33
    const-string v2, "CheckBox 2"

    invoke-static {v8}, Lcom/maars/fmenu/PBoolean;->of(Z)Lcom/maars/fmenu/PBoolean;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/maars/fmenu/Menu;->CheckBox(Ljava/lang/String;Lcom/maars/fmenu/PBoolean;)V

    .line 34
    const-string v10, "External Link &nearr;"

    const-string v11, "https://youtu.be/dQw4w9WgXcQ"

    invoke-virtual {v1, v10, v11}, Lcom/maars/fmenu/Menu;->ButtonLink(Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    const-string v3, "SeekBar 2"

    invoke-static {v8}, Lcom/maars/fmenu/PInteger;->of(I)Lcom/maars/fmenu/PInteger;

    move-result-object v4

    const/16 v5, -0x32

    move-object v2, v1

    invoke-virtual/range {v2 .. v7}, Lcom/maars/fmenu/Menu;->SeekBar(Ljava/lang/String;Lcom/maars/fmenu/PInteger;III)V

    .line 36
    invoke-static {v8}, Lcom/maars/fmenu/PInteger;->of(I)Lcom/maars/fmenu/PInteger;

    move-result-object v2

    const-string v12, "SeekBar 3"

    const/4 v13, 0x5

    invoke-virtual {v1, v12, v2, v8, v13}, Lcom/maars/fmenu/Menu;->SeekBar(Ljava/lang/String;Lcom/maars/fmenu/PInteger;II)V

    .line 37
    const-string v14, "Option 1"

    const-string v15, "Option 2"

    const-string v7, "Option 3"

    filled-new-array {v14, v15, v7}, [Ljava/lang/String;

    move-result-object v2

    invoke-static {v8}, Lcom/maars/fmenu/PInteger;->of(I)Lcom/maars/fmenu/PInteger;

    move-result-object v3

    const-string v6, "Radio Button 1"

    invoke-virtual {v1, v6, v2, v3}, Lcom/maars/fmenu/Menu;->RadioButton(Ljava/lang/String;[Ljava/lang/String;Lcom/maars/fmenu/PInteger;)V

    .line 39
    const-string v2, "Collapse 1"

    invoke-virtual {v1, v2}, Lcom/maars/fmenu/Menu;->startCollapse(Ljava/lang/String;)V

    .line 41
    new-instance v2, Lcom/maars/fmenu/MainActivity$$ExternalSyntheticLambda0;

    invoke-direct {v2, v0}, Lcom/maars/fmenu/MainActivity$$ExternalSyntheticLambda0;-><init>(Lcom/maars/fmenu/MainActivity;)V

    const-string v3, "Button 3"

    invoke-virtual {v1, v3, v2}, Lcom/maars/fmenu/Menu;->ButtonAction(Ljava/lang/String;Ljava/lang/Runnable;)V

    .line 49
    invoke-virtual {v1, v10, v11}, Lcom/maars/fmenu/Menu;->ButtonLink(Ljava/lang/String;Ljava/lang/String;)V

    .line 50
    const-string v3, "SeekBar 2"

    invoke-static {v8}, Lcom/maars/fmenu/PInteger;->of(I)Lcom/maars/fmenu/PInteger;

    move-result-object v4

    const/16 v10, 0x64

    const/4 v11, 0x5

    move-object v2, v1

    move-object/from16 v16, v6

    move v6, v10

    move-object v10, v7

    move v7, v11

    invoke-virtual/range {v2 .. v7}, Lcom/maars/fmenu/Menu;->SeekBar(Ljava/lang/String;Lcom/maars/fmenu/PInteger;III)V

    .line 51
    invoke-static {v8}, Lcom/maars/fmenu/PInteger;->of(I)Lcom/maars/fmenu/PInteger;

    move-result-object v2

    invoke-virtual {v1, v12, v2, v8, v13}, Lcom/maars/fmenu/Menu;->SeekBar(Ljava/lang/String;Lcom/maars/fmenu/PInteger;II)V

    .line 52
    invoke-static {v8}, Lcom/maars/fmenu/PBoolean;->of(Z)Lcom/maars/fmenu/PBoolean;

    move-result-object v2

    invoke-virtual {v1, v9, v2}, Lcom/maars/fmenu/Menu;->Switch(Ljava/lang/String;Lcom/maars/fmenu/PBoolean;)V

    .line 54
    invoke-virtual {v1}, Lcom/maars/fmenu/Menu;->endCollapse()V

    .line 56
    const-string v2, "This is a TextView not fully html supported. <b>bold</b> <i>italic</i> <u>underline</u> <s>strikethrough</s> <font color=\'red\'>color</font> <font size=\'20\'>size</font> <font face=\'monospace\'>face</font> <a href=\'https://www.google.com\'>link</a>"

    invoke-virtual {v1, v2}, Lcom/maars/fmenu/Menu;->TextView(Ljava/lang/String;)V

    .line 58
    const-string v3, "SeekBar 2"

    invoke-static {v8}, Lcom/maars/fmenu/PInteger;->of(I)Lcom/maars/fmenu/PInteger;

    move-result-object v4

    const/16 v6, 0x64

    const/4 v7, 0x5

    move-object v2, v1

    invoke-virtual/range {v2 .. v7}, Lcom/maars/fmenu/Menu;->SeekBar(Ljava/lang/String;Lcom/maars/fmenu/PInteger;III)V

    .line 60
    const-string v2, "<html><head><style>body{color: white;}</style></head><body>This is WebView, with REAL HTML support!<div style=\"background-color: darkblue; text-align: center;\">Support CSS</div><marquee style=\"color: green; font-weight:bold;\" direction=\"left\" scrollamount=\"5\" behavior=\"scroll\">This is <u>scrollable</u> text</marquee></body></html>"

    invoke-virtual {v1, v2}, Lcom/maars/fmenu/Menu;->WebTextView(Ljava/lang/String;)V

    .line 62
    invoke-static {v8}, Lcom/maars/fmenu/PInteger;->of(I)Lcom/maars/fmenu/PInteger;

    move-result-object v2

    invoke-virtual {v1, v12, v2, v8, v13}, Lcom/maars/fmenu/Menu;->SeekBar(Ljava/lang/String;Lcom/maars/fmenu/PInteger;II)V

    .line 63
    filled-new-array {v14, v15, v10}, [Ljava/lang/String;

    move-result-object v2

    invoke-static {v8}, Lcom/maars/fmenu/PInteger;->of(I)Lcom/maars/fmenu/PInteger;

    move-result-object v3

    move-object/from16 v4, v16

    invoke-virtual {v1, v4, v2, v3}, Lcom/maars/fmenu/Menu;->RadioButton(Ljava/lang/String;[Ljava/lang/String;Lcom/maars/fmenu/PInteger;)V

    .line 64
    return-void
.end method


# virtual methods
.method synthetic lambda$TestMenu$0$com-maars-fmenu-MainActivity()V
    .locals 3

    .line 42
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 43
    .local v0, "builder":Landroid/app/AlertDialog$Builder;
    const-string v1, "Alert"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 44
    const-string v1, "This is an alert"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 45
    const-string v1, "OK"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 46
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 47
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 0
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .line 12
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 14
    invoke-direct {p0}, Lcom/maars/fmenu/MainActivity;->TestMenu()V

    .line 15
    return-void
.end method
