using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Effect : MonoBehaviour
{
    public float time = 1f;
    public void Init(string name)
    {
        StartCoroutine(wait(name));
    }
    private IEnumerator wait(string name)
    {
        yield return new WaitForSeconds(time);
        gameObject.SetActive(false);
        ObjectPool.Set(name, this);
    }
}
