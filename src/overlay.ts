
enum TracingPoint {
  BOTTOM,
  TOP,
  CENTER
}

export interface EntityProperties {
  color: number;
  boxHeight: number;
  boxWidth: number;
  name: string;
  barMax: number;
  barAmount: number;
  isTracing: boolean;
  tracer: TracingPoint;
  isVisible: boolean;
  position: Vec3;
}

export class Entity implements EntityProperties {
  color = Java.use('android.graphics.Paint').rgb(255, 0, 255);
  boxHeight = 1;
  boxWidth = 1;
  name = "";
  barMax = 0;
  barAmount = 0;
  isTracing = false;
  tracer: TracingPoint = TracingPoint.BOTTOM;
  isVisible = true;
  position: Vec3 = { x: 0, y: 0, z: 0 };

  constructor(name: string, position: Vec3) {
    this.name = name;
    this.position = position;
  }

  setPosition(x: number, y: number, z: number) {
    this.position = { x, y, z };
  }
}

export class Camera {
  position: Vec3 = { x: 0, y: 0, z: 0 };
  rotation: Vec2 = { x: 0, y: 0 }; // [pitch, yaw]
  aspectRatio = 16 / 9;

  constructor(position: Vec3) {
    this.position = position || { x: 0, y: 0, z: 0 };
  }
}

export class Overlay {
  public TextPaint: Java.Wrapper;
  public StrokePaint: Java.Wrapper;
  public FillPaint: Java.Wrapper;
  public textSize = 20;
  public entities: Entity[] = [];
  public camera: Camera;
  public rotationOffset: Vec2 = { x: 0, y: 0 };
  private _overlayView: Java.Wrapper;
  private _rootView: Java.Wrapper;
  private _loopTimer: NodeJS.Timer | null = null;
  private _loopInterval = 1000 / 60; // 60 FPS
  private _enableOverlay = true;

  constructor(mainActivity: Java.Wrapper, ticker: (o: Overlay) => void, options?: {
    rotationOffset?: Vec2;
  }) {
    const Color = Java.use('android.graphics.Color');
    const viewGroup = Java.use('android.view.ViewGroup');

    if (options){
      this.rotationOffset = options.rotationOffset || { x: 0, y: 0 };
    }
  
    this.TextPaint = this.createTextPaint(Color.parseColor("#FF00FF"));
    this.StrokePaint = this.createStrokePaint(Color.parseColor("#FF00FF"));
    this.FillPaint = this.createFillPaint(Color.parseColor("#FFFF00"));

    this._overlayView = Java.use('com.ftemp.OverlayView').$new(mainActivity);
    this._rootView = Java.cast(mainActivity.getWindow().getDecorView().getRootView(), viewGroup);

    Java.scheduleOnMainThread(() => {
      if(this._overlayView.getParent() !== null) this._rootView.removeView(this._overlayView);
      
      this._rootView.addView(this._overlayView);

      this._overlayView.setVisibility(0);

      this._loopTimer = setInterval(() => {
        this._overlayView.postInvalidate();
        ticker(this);
      }, this._loopInterval);

      console.log("Overlay initialized and started.", this._overlayView.isAttachedToWindow());
    });


    this.camera = new Camera({ x: 0, y: 0, z: 0 });

    const self = this;
    this._overlayView.onDraw.implementation = function (canvas: Java.Wrapper) {
      const [width, height] = [canvas.getWidth(), canvas.getHeight()];
      canvas.drawText('Modded by Frida', 100, 20, self.TextPaint);
      // canvas.drawRect(200, 200, width-200, height-200, self.StrokePaint);
      if (!self._enableOverlay) return this.onDraw.call(this, canvas);
      self.entities.forEach((entity) => {
        if (entity.isVisible) {
          // draw 3d box based entity's properties
          const position = entity.position;
          const boxWidth = entity.boxWidth;
          const boxHeight = entity.boxHeight;
          const box: Vec3[] = [
            {x: position.x + boxWidth/2, y: position.y, z: position.z + boxWidth/2},
            {x: position.x + boxWidth/2, y: position.y, z: position.z - boxWidth/2},
            {x: position.x - boxWidth/2, y: position.y, z: position.z + boxWidth/2},
            {x: position.x - boxWidth/2, y: position.y, z: position.z - boxWidth/2},
            {x: position.x + boxWidth/2, y: position.y + boxHeight, z: position.z + boxWidth/2},
            {x: position.x + boxWidth/2, y: position.y + boxHeight, z: position.z - boxWidth/2},
            {x: position.x - boxWidth/2, y: position.y + boxHeight, z: position.z - boxWidth/2},
            {x: position.x - boxWidth/2, y: position.y + boxHeight, z: position.z + boxWidth/2},
          ]
        }
      });
    };
  }

  private calcPoint(target: Vec3, camera: Camera, rotationOffset: Vec2): Vec2 {
    const dx = target.x - camera.position.x;
    const dy = target.y - camera.position.y;
    const dz = target.z - camera.position.z;
    let rotatedX:number = dx * Math.cos(camera.rotation.y + rotationOffset.y) - dz * Math.sin(camera.rotation.y + rotationOffset.y);
    let rotatedZ:number = dz * Math.cos(camera.rotation.y + rotationOffset.y) + dx * Math.sin(camera.rotation.y + rotationOffset.y);
    let rotatedY:number = dy * Math.cos(camera.rotation.x) - rotatedZ * Math.sin(camera.rotation.x);
    rotatedZ = rotatedZ * Math.cos(camera.rotation.x) + dy * Math.sin(camera.rotation.x);
    const pointX = - rotatedX / rotatedZ;
    const pointY = - rotatedY / rotatedZ * camera.aspectRatio;
    return { x: pointX, y: pointY };
  }

  private createTextPaint(color: number): Java.Wrapper {
    const Paint = Java.use('android.graphics.Paint');
    const Paint$Style = Java.use('android.graphics.Paint$Style');
    const Paint$Align = Java.use('android.graphics.Paint$Align');
    
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
    const Paint = Java.use('android.graphics.Paint');
    const Paint$Style = Java.use('android.graphics.Paint$Style');

    const paint = Paint.$new();
    paint.setStrokeWidth(3);
    paint.setStyle(Paint$Style.STROKE.value);
    paint.setAntiAlias(true);
    paint.setColor(color);
    return paint;
  }

  private createFillPaint(color: number): Java.Wrapper {
    const Paint = Java.use('android.graphics.Paint');
    const Paint$Style = Java.use('android.graphics.Paint$Style');

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