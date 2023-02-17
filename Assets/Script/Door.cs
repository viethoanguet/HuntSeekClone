using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using DG.Tweening;
public class Door : MonoBehaviour
{
    public AudioClip musicdoor;
    public void rotationDoor()
    {
        gameObject.transform.DORotate(
       new Vector3(0f, -120f, 0), 1.5f)
       .SetEase(Ease.Linear)
       .OnComplete(() => rotationDoorComback());
        AudioManager.Instance.OndoorPlay(musicdoor);
    }
    public void rotationDoorComback()
    {
        gameObject.transform.DORotate(
       new Vector3(0f, 0, 0), 2f)
       .SetEase(Ease.Linear);
    }
    private void OnDisable()
    {
        transform.DOKill();
    }
}
