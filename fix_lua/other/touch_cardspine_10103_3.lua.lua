local CLICK_INTERVAL = 0
local OnClick = function(skeletonAnimation, animationName, gesture)
  local go = skeletonAnimation.gameObject
  local track = 0
  local current = skeletonAnimation.state:GetCurrent(track)
  if nil == current or current.Animation.Name ~= animationName or current.TrackTime >= CLICK_INTERVAL then
    SkeletonAnimationUtil.SetAnimation(go, track, animationName, false, function()
      SkeletonAnimationUtil.SetAnimation(go, track, "idle", true)
    end)
  end
end
return {OnClick = OnClick}
