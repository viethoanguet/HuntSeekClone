using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
public class BannerDelay321 : MonoBehaviour
{
    [SerializeField] private List<GameObject> list321;

    private void Start()
    {
     // StartCoroutine(WaitBanner321());
    }
    public void aaaa()
    {
        StartCoroutine(WaitBanner321());
    }
    IEnumerator WaitBanner321()
    {
        for (int i = 0; i < list321.Count; i++)
        {

            yield return new WaitForSeconds(1f);
            {
                list321[i].gameObject.SetActive(true);
            }
        }
        yield return new WaitForSeconds(1f);
        gameObject.SetActive(false);

    }
    private void OnDisable()
    {
        StopAllCoroutines();
    }
}