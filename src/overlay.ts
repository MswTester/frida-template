import { Color, Paint, Paint$Align, Paint$Style, viewGroup } from "./classes";

enum TracingPoint {
  BOTTOM,
  TOP,
  CENTER
}

export class Entity {
  color = Color.rgb(255, 0, 255);
  boxHeight = 1;
  boxWidth = 1;
  name = "";
  barMax = 0;
  barAmount = 0;
  isTracing = false;
  tracer: TracingPoint = TracingPoint.BOTTOM;
  isVisible = true;
  position: Vec3 = { x: 0, y: 0, z: 0 };

  constructor() {
  }
}

export class Camera {
  position: Vec3 = { x: 0, y: 0, z: 0 };
  rotation: Vec2 = { x: 0, y: 0 }; // [pitch, yaw]
  fov: Vec2 = { x: 90, y: 50 }; // [horizontal, vertical]
  aspectRatio = 16 / 9;
}

export class Overlay {
  public TextPaint: Java.Wrapper;
  public StrokePaint: Java.Wrapper;
  public FillPaint: Java.Wrapper;
  public textSize = 20;
  private _overlayView: Java.Wrapper;
  private _rootView: Java.Wrapper;
  private _loopTimer?: NodeJS.Timer;
  private _loopInterval = 1000 / 60; // 60 FPS
  private _enableOverlay = true;
  private _entities: Entity[] = [];
  private _camera: Camera = new Camera();

  constructor(mainActivity: Java.Wrapper) {
    this.TextPaint = this.createTextPaint(Color.rgb(255, 255, 255));
    this.StrokePaint = this.createStrokePaint(Color.rgb(255, 255, 255));
    this.FillPaint = this.createFillPaint(Color.rgb(255, 0, 255));

    this._overlayView = Java.use('com.ftemp.OverlayView').$new(mainActivity);
    this._rootView = Java.cast(mainActivity.getWindow().getDecorView().getRootView(), viewGroup);

    Java.scheduleOnMainThread(() => {
      this._rootView.addView(this._overlayView);
      this._overlayView.postInvalidate();
    });

    this._loopTimer = setInterval(() => {
      this._overlayView.postInvalidate();
    }, this._loopInterval);

    const self = this;
    this._overlayView.onDraw.implementation = function (canvas: Java.Wrapper) {
      const [width, height] = [canvas.getWidth(), canvas.getHeight()];
      canvas.drawText('Modded by Frida', 80, 20, self.TextPaint);
      if (!self._enableOverlay) return this.onDraw(canvas);
      self._entities.forEach((entity) => {
        if (entity.isVisible) {
          // draw 3d box based entity's properties
        }
      });
    };
  }

  private createTextPaint(color: number): Java.Wrapper {
    const paint = Paint.$new();
    paint.setStyle(Paint$Style.FILL_AND_STROKE.value);
    paint.setAntiAlias(true);
    paint.setColor(color);
    paint.setTextAlign(Paint$Align.CENTER.value);
    paint.setStrokeWidth(1.1);
    paint.setTextSize(this.textSize);
    return paint;
  }

  private createStrokePaint(color: number): Java.Wrapper {
    const paint = Paint.$new();
    paint.setStrokeWidth(3);
    paint.setStyle(Paint$Style.STROKE.value);
    paint.setAntiAlias(true);
    paint.setColor(color);
    return paint;
  }

  private createFillPaint(color: number): Java.Wrapper {
    const paint = Paint.$new();
    paint.setStyle(Paint$Style.FILL.value);
    paint.setAntiAlias(true);
    paint.setColor(color);
    return paint;
  }

  set enableOverlay(value: boolean) {
    this._enableOverlay = value;
    this._overlayView.postInvalidate();
  }

  get enableOverlay(): boolean {
    return this._enableOverlay;
  }
}