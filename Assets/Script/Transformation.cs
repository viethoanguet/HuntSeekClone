using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using DG.Tweening;
public class Transformation : MonoBehaviour
{ 
    private void TranformationRandom()
    {
        gameObject.transform.DOScale(new Vector3(1, 1, 1), 1f);
    }    

}
