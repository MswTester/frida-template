.class final Lcom/google/android/material/carousel/MultiBrowseCarouselStrategy$Arrangement;
.super Ljava/lang/Object;
.source "MultiBrowseCarouselStrategy.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/material/carousel/MultiBrowseCarouselStrategy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Arrangement"
.end annotation


# instance fields
.field final cost:F

.field final largeCount:I

.field largeSize:F

.field final mediumCount:I

.field mediumSize:F

.field final priority:I

.field final smallCount:I

.field smallSize:F


# direct methods
.method constructor <init>(IFFFIFIFIF)V
    .locals 1
    .param p1, "priority"    # I
    .param p2, "targetSmallSize"    # F
    .param p3, "minSmallSize"    # F
    .param p4, "maxSmallSize"    # F
    .param p5, "smallCount"    # I
    .param p6, "targetMediumSize"    # F
    .param p7, "mediumCount"    # I
    .param p8, "targetLargeSize"    # F
    .param p9, "largeCount"    # I
    .param p10, "availableSpace"    # F

    .line 320
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 321
    iput p1, p0, Lcom/google/android/material/carousel/MultiBrowseCarouselStrategy$Arrangement;->priority:I

    .line 322
    invoke-static {p2, p3, p4}, Landroidx/core/math/MathUtils;->clamp(FFF)F

    move-result v0

    iput v0, p0, Lcom/google/android/material/carousel/MultiBrowseCarouselStrategy$Arrangement;->smallSize:F

    .line 323
    iput p5, p0, Lcom/google/android/material/carousel/MultiBrowseCarouselStrategy$Arrangement;->smallCount:I

    .line 324
    iput p6, p0, Lcom/google/android/material/carousel/MultiBrowseCarouselStrategy$Arrangement;->mediumSize:F

    .line 325
    iput p7, p0, Lcom/google/android/material/carousel/MultiBrowseCarouselStrategy$Arrangement;->mediumCount:I

    .line 326
    iput p8, p0, Lcom/google/android/material/carousel/MultiBrowseCarouselStrategy$Arrangement;->largeSize:F

    .line 327
    iput p9, p0, Lcom/google/android/material/carousel/MultiBrowseCarouselStrategy$Arrangement;->largeCount:I

    .line 329
    invoke-direct {p0, p10, p3, p4, p8}, Lcom/google/android/material/carousel/MultiBrowseCarouselStrategy$Arrangement;->fit(FFFF)V

    .line 330
    invoke-direct {p0, p8}, Lcom/google/android/material/carousel/MultiBrowseCarouselStrategy$Arrangement;->cost(F)F

    move-result v0

    iput v0, p0, Lcom/google/android/material/carousel/MultiBrowseCarouselStrategy$Arrangement;->cost:F

    .line 331
    return-void
.end method

.method private calculateLargeSize(FIFII)F
    .locals 4
    .param p1, "availableSpace"    # F
    .param p2, "smallCount"    # I
    .param p3, "smallSize"    # F
    .param p4, "mediumCount"    # I
    .param p5, "largeCount"    # I

    .line 427
    if-lez p2, :cond_0

    move v0, p3

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    move p3, v0

    .line 428
    int-to-float v0, p2

    int-to-float v1, p4

    const/high16 v2, 0x40000000    # 2.0f

    div-float/2addr v1, v2

    add-float/2addr v0, v1

    mul-float v0, v0, p3

    sub-float v0, p1, v0

    int-to-float v1, p5

    int-to-float v3, p4

    div-float/2addr v3, v2

    add-float/2addr v1, v3

    div-float/2addr v0, v1

    return v0
.end method

.method private cost(F)F
    .locals 2
    .param p1, "targetLargeSize"    # F

    .line 450
    invoke-direct {p0}, Lcom/google/android/material/carousel/MultiBrowseCarouselStrategy$Arrangement;->isValid()Z

    move-result v0

    if-nez v0, :cond_0

    .line 451
    const v0, 0x7f7fffff    # Float.MAX_VALUE

    return v0

    .line 455
    :cond_0
    iget v0, p0, Lcom/google/android/material/carousel/MultiBrowseCarouselStrategy$Arrangement;->largeSize:F

    sub-float v0, p1, v0

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    iget v1, p0, Lcom/google/android/material/carousel/MultiBrowseCarouselStrategy$Arrangement;->priority:I

    int-to-float v1, v1

    mul-float v0, v0, v1

    return v0
.end method

.method private fit(FFFF)V
    .locals 10
    .param p1, "availableSpace"    # F
    .param p2, "minSmallSize"    # F
    .param p3, "maxSmallSize"    # F
    .param p4, "targetLargeSize"    # F

    .line 374
    invoke-direct {p0}, Lcom/google/android/material/carousel/MultiBrowseCarouselStrategy$Arrangement;->getSpace()F

    move-result v0

    sub-float v0, p1, v0

    .line 377
    .local v0, "delta":F
    iget v1, p0, Lcom/google/android/material/carousel/MultiBrowseCarouselStrategy$Arrangement;->smallCount:I

    const/4 v2, 0x0

    if-lez v1, :cond_0

    cmpl-float v3, v0, v2

    if-lez v3, :cond_0

    .line 379
    iget v3, p0, Lcom/google/android/material/carousel/MultiBrowseCarouselStrategy$Arrangement;->smallSize:F

    int-to-float v1, v1

    div-float v1, v0, v1

    sub-float v4, p3, v3

    invoke-static {v1, v4}, Ljava/lang/Math;->min(FF)F

    move-result v1

    add-float/2addr v3, v1

    iput v3, p0, Lcom/google/android/material/carousel/MultiBrowseCarouselStrategy$Arrangement;->smallSize:F

    goto :goto_0

    .line 380
    :cond_0
    if-lez v1, :cond_1

    cmpg-float v3, v0, v2

    if-gez v3, :cond_1

    .line 382
    iget v3, p0, Lcom/google/android/material/carousel/MultiBrowseCarouselStrategy$Arrangement;->smallSize:F

    int-to-float v1, v1

    div-float v1, v0, v1

    sub-float v4, p2, v3

    invoke-static {v1, v4}, Ljava/lang/Math;->max(FF)F

    move-result v1

    add-float/2addr v3, v1

    iput v3, p0, Lcom/google/android/material/carousel/MultiBrowseCarouselStrategy$Arrangement;->smallSize:F

    .line 385
    :cond_1
    :goto_0
    iget v6, p0, Lcom/google/android/material/carousel/MultiBrowseCarouselStrategy$Arrangement;->smallCount:I

    iget v7, p0, Lcom/google/android/material/carousel/MultiBrowseCarouselStrategy$Arrangement;->smallSize:F

    iget v8, p0, Lcom/google/android/material/carousel/MultiBrowseCarouselStrategy$Arrangement;->mediumCount:I

    iget v9, p0, Lcom/google/android/material/carousel/MultiBrowseCarouselStrategy$Arrangement;->largeCount:I

    .line 386
    move-object v4, p0

    move v5, p1

    invoke-direct/range {v4 .. v9}, Lcom/google/android/material/carousel/MultiBrowseCarouselStrategy$Arrangement;->calculateLargeSize(FIFII)F

    move-result v1

    iput v1, p0, Lcom/google/android/material/carousel/MultiBrowseCarouselStrategy$Arrangement;->largeSize:F

    .line 387
    iget v3, p0, Lcom/google/android/material/carousel/MultiBrowseCarouselStrategy$Arrangement;->smallSize:F

    add-float/2addr v3, v1

    const/high16 v4, 0x40000000    # 2.0f

    div-float/2addr v3, v4

    iput v3, p0, Lcom/google/android/material/carousel/MultiBrowseCarouselStrategy$Arrangement;->mediumSize:F

    .line 392
    iget v4, p0, Lcom/google/android/material/carousel/MultiBrowseCarouselStrategy$Arrangement;->mediumCount:I

    if-lez v4, :cond_3

    cmpl-float v5, v1, p4

    if-eqz v5, :cond_3

    .line 393
    sub-float v1, p4, v1

    iget v5, p0, Lcom/google/android/material/carousel/MultiBrowseCarouselStrategy$Arrangement;->largeCount:I

    int-to-float v5, v5

    mul-float v1, v1, v5

    .line 394
    .local v1, "targetAdjustment":F
    const v5, 0x3dcccccd    # 0.1f

    mul-float v3, v3, v5

    int-to-float v4, v4

    mul-float v3, v3, v4

    .line 395
    .local v3, "availableMediumFlex":F
    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v4

    invoke-static {v4, v3}, Ljava/lang/Math;->min(FF)F

    move-result v4

    .line 396
    .local v4, "distribute":F
    cmpl-float v2, v1, v2

    if-lez v2, :cond_2

    .line 398
    iget v2, p0, Lcom/google/android/material/carousel/MultiBrowseCarouselStrategy$Arrangement;->mediumSize:F

    iget v5, p0, Lcom/google/android/material/carousel/MultiBrowseCarouselStrategy$Arrangement;->mediumCount:I

    int-to-float v5, v5

    div-float v5, v4, v5

    sub-float/2addr v2, v5

    iput v2, p0, Lcom/google/android/material/carousel/MultiBrowseCarouselStrategy$Arrangement;->mediumSize:F

    .line 399
    iget v2, p0, Lcom/google/android/material/carousel/MultiBrowseCarouselStrategy$Arrangement;->largeSize:F

    iget v5, p0, Lcom/google/android/material/carousel/MultiBrowseCarouselStrategy$Arrangement;->largeCount:I

    int-to-float v5, v5

    div-float v5, v4, v5

    add-float/2addr v2, v5

    iput v2, p0, Lcom/google/android/material/carousel/MultiBrowseCarouselStrategy$Arrangement;->largeSize:F

    goto :goto_1

    .line 402
    :cond_2
    iget v2, p0, Lcom/google/android/material/carousel/MultiBrowseCarouselStrategy$Arrangement;->mediumSize:F

    iget v5, p0, Lcom/google/android/material/carousel/MultiBrowseCarouselStrategy$Arrangement;->mediumCount:I

    int-to-float v5, v5

    div-float v5, v4, v5

    add-float/2addr v2, v5

    iput v2, p0, Lcom/google/android/material/carousel/MultiBrowseCarouselStrategy$Arrangement;->mediumSize:F

    .line 403
    iget v2, p0, Lcom/google/android/material/carousel/MultiBrowseCarouselStrategy$Arrangement;->largeSize:F

    iget v5, p0, Lcom/google/android/material/carousel/MultiBrowseCarouselStrategy$Arrangement;->largeCount:I

    int-to-float v5, v5

    div-float v5, v4, v5

    sub-float/2addr v2, v5

    iput v2, p0, Lcom/google/android/material/carousel/MultiBrowseCarouselStrategy$Arrangement;->largeSize:F

    .line 406
    .end local v1    # "targetAdjustment":F
    .end local v3    # "availableMediumFlex":F
    .end local v4    # "distribute":F
    :cond_3
    :goto_1
    return-void
.end method

.method private getSpace()F
    .locals 3

    .line 357
    iget v0, p0, Lcom/google/android/material/carousel/MultiBrowseCarouselStrategy$Arrangement;->largeSize:F

    iget v1, p0, Lcom/google/android/material/carousel/MultiBrowseCarouselStrategy$Arrangement;->largeCount:I

    int-to-float v1, v1

    mul-float v0, v0, v1

    iget v1, p0, Lcom/google/android/material/carousel/MultiBrowseCarouselStrategy$Arrangement;->mediumSize:F

    iget v2, p0, Lcom/google/android/material/carousel/MultiBrowseCarouselStrategy$Arrangement;->mediumCount:I

    int-to-float v2, v2

    mul-float v1, v1, v2

    add-float/2addr v0, v1

    iget v1, p0, Lcom/google/android/material/carousel/MultiBrowseCarouselStrategy$Arrangement;->smallSize:F

    iget v2, p0, Lcom/google/android/material/carousel/MultiBrowseCarouselStrategy$Arrangement;->smallCount:I

    int-to-float v2, v2

    mul-float v1, v1, v2

    add-float/2addr v0, v1

    return v0
.end method

.method private isValid()Z
    .locals 4

    .line 433
    iget v0, p0, Lcom/google/android/material/carousel/MultiBrowseCarouselStrategy$Arrangement;->largeCount:I

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-lez v0, :cond_1

    iget v3, p0, Lcom/google/android/material/carousel/MultiBrowseCarouselStrategy$Arrangement;->smallCount:I

    if-lez v3, :cond_1

    iget v3, p0, Lcom/google/android/material/carousel/MultiBrowseCarouselStrategy$Arrangement;->mediumCount:I

    if-lez v3, :cond_1

    .line 434
    iget v0, p0, Lcom/google/android/material/carousel/MultiBrowseCarouselStrategy$Arrangement;->largeSize:F

    iget v3, p0, Lcom/google/android/material/carousel/MultiBrowseCarouselStrategy$Arrangement;->mediumSize:F

    cmpl-float v0, v0, v3

    if-lez v0, :cond_0

    iget v0, p0, Lcom/google/android/material/carousel/MultiBrowseCarouselStrategy$Arrangement;->smallSize:F

    cmpl-float v0, v3, v0

    if-lez v0, :cond_0

    const/4 v1, 0x1

    :cond_0
    return v1

    .line 435
    :cond_1
    if-lez v0, :cond_3

    iget v0, p0, Lcom/google/android/material/carousel/MultiBrowseCarouselStrategy$Arrangement;->smallCount:I

    if-lez v0, :cond_3

    .line 436
    iget v0, p0, Lcom/google/android/material/carousel/MultiBrowseCarouselStrategy$Arrangement;->largeSize:F

    iget v3, p0, Lcom/google/android/material/carousel/MultiBrowseCarouselStrategy$Arrangement;->smallSize:F

    cmpl-float v0, v0, v3

    if-lez v0, :cond_2

    const/4 v1, 0x1

    :cond_2
    return v1

    .line 439
    :cond_3
    return v2
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 2

    .line 336
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Arrangement [priority="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/google/android/material/carousel/MultiBrowseCarouselStrategy$Arrangement;->priority:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", smallCount="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/google/android/material/carousel/MultiBrowseCarouselStrategy$Arrangement;->smallCount:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", smallSize="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/google/android/material/carousel/MultiBrowseCarouselStrategy$Arrangement;->smallSize:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", mediumCount="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/google/android/material/carousel/MultiBrowseCarouselStrategy$Arrangement;->mediumCount:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", mediumSize="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/google/android/material/carousel/MultiBrowseCarouselStrategy$Arrangement;->mediumSize:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", largeCount="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/google/android/material/carousel/MultiBrowseCarouselStrategy$Arrangement;->largeCount:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", largeSize="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/google/android/material/carousel/MultiBrowseCarouselStrategy$Arrangement;->largeSize:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", cost="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/google/android/material/carousel/MultiBrowseCarouselStrategy$Arrangement;->cost:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
