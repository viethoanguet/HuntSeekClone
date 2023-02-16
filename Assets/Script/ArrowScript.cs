using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using DG.Tweening;
public class ArrowScript : MonoBehaviour
{
    public bool checkArrow=false;
    private BoxCollider box;
    private void Start()
    {
    }
    private void OnEnable()
    {
        StartCoroutine(WaitDelayOnEnable());
        box = GetComponent<BoxCollider>();
    }
    public void RandomRotation()
    {
        gameObject.transform.DORotate(
                new Vector3(0f, 1600, 0f), 2.5f, RotateMode.FastBeyond360)
                //Random.Range(20f, 180f)
                .SetEase(Ease.Linear)
                .OnComplete(() => ActiveBox());
            StartCoroutine(StopRotation());
    }
    public void RandomRotationHunter()
    {
        gameObject.transform.DORotate(
                new Vector3(0f, 1440, 0f), 2.5f, RotateMode.FastBeyond360)
                .SetEase(Ease.Linear)
                .OnComplete(() => ActiveBox());
        StartCoroutine(StopRotation());
    }
    IEnumerator StopRotation()
    {
        yield return new WaitForSeconds(3f);
        {
            checkArrow = true;
            box.enabled = false;
            gameObject.SetActive(false);
        }
    }
    private void ActiveBox()
    {
        box.enabled = true;
        transform.DOKill();
    }
    private void OnDisable()
    {
       // checkArrow = false;
       StopAllCoroutines();
    }
    IEnumerator WaitDelayOnEnable()
    {

        yield return new WaitForSeconds(0.4f);
        {
          //  checkArrow = false;
            if (DataManager.instance.userData.level != 2)
            {
                RandomRotation();
            }
            else
            {
                RandomRotationHunter();
            }
        }
    }
}
