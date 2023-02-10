using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using DG.Tweening;
public class Door : MonoBehaviour
{
    // Start is called before the first frame update
    private void Start()
    {
       
    }
    public void rotationDoor()
    {
        gameObject.transform.DORotate(
       new Vector3(0f, -120f, 0), 3f)
       .SetEase(Ease.Linear)
       .OnComplete(() => rotationDoorComback());
        AudioManager.Instance.onDoor();
    }
    public void rotationDoorComback()
    {
        gameObject.transform.DORotate(
       new Vector3(0f, 0, 0), 3f)
       .SetEase(Ease.Linear);
    }
    private void OnDisable()
    {
        transform.DOKill();
    }
}
