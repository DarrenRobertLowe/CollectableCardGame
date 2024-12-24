///updateAuraScale(scale target)
var scaleTarget = argument0;
var scaleDist = abs(scaleTarget - auraScale);

if (scaleDist <= auraScaleDistanceMin) {
    auraScale = scaleTarget;
} else {
    var scaleSpeed = (scaleDist * auraScaleSpeedMax);
    auraScale += (auraScaleDirection * scaleSpeed);
}
