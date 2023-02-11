using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using DG.Tweening;
public class ArrowScript : MonoBehaviour
{
    public bool checkArrow;
    private BoxCollider box;
    private void Start()
    {
        box = GetComponent<BoxCollider>();
       // checkArrow = true;
        //RandomRotation();
    }
    private void OnEnable()
    {
        checkArrow = false;
        if (DataManager.instance.userData.level != 2)
        {
            RandomRotation();
        }    
        else
        {
            RandomRotationHunter();
        }
    }
    public void RandomRotation()
    {
        // if (checkArrow)
        // {
        gameObject.transform.DORotate(
                new Vector3(0f, 1180f+ Random.Range(20f, 180f), 0f), 2.5f, RotateMode.FastBeyond360)
                //1400 + Random.Range(0, 360f)
                // .SetLoops(-1, LoopType.Restart)
                .SetEase(Ease.Linear)
                .OnComplete(() => ActiveBox());
            StartCoroutine(StopRotation());
       // }
    }
    public void RandomRotationHunter()
    {
        gameObject.transform.DORotate(
                new Vector3(0f, 1450f, 0f), 2.5f, RotateMode.FastBeyond360)
                .SetEase(Ease.Linear)
                .OnComplete(() => ActiveBox());
        StartCoroutine(StopRotation());
    }
    IEnumerator StopRotation()
    {

        yield return new WaitForSeconds(2.5f);
        {
            gameObject.SetActive(false);
            checkArrow = true;
            box.enabled = false;      
        }
    }
    private void ActiveBox()
    {
        box.enabled = true;
        transform.DOKill();
    }
    private void OnDisable()
    {
        StopAllCoroutines();
    }
}
