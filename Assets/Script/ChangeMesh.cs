using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ChangeMesh : MonoBehaviour
{
    [SerializeField] private MeshFilter modelFilter;
     private Mesh modelOLd;
    [SerializeField] private Mesh[] modelChange;
    [SerializeField] private int current;
    public GameObject effect;
    public GameObject skin;
    public GameObject skinNormal;
    public Material roomtexture;
    private void Start()
    {
        modelOLd = modelFilter.mesh;
        effect.gameObject.SetActive(false);
        StartCoroutine(Changemesh());
        skin.gameObject.SetActive(true);
        skinNormal.gameObject.SetActive(false);
    }
    public void ChangeMeshModel()
    {
        //effect.gameObject.SetActive(true);
        modelFilter.mesh = modelChange[current];
        modelFilter.GetComponent<Renderer>().material =roomtexture ;
       // EffectManager.Instance.SpawnWhiteEffect(transform.position, transform);
       
    }
    IEnumerator Changemesh()
    {
        yield return new WaitForSeconds(3f);
        {
            skin.gameObject.SetActive(false);
            effect.gameObject.SetActive(true);
            skinNormal.gameObject.SetActive(true);

            yield return new WaitForSeconds(0.2f);
            {
                ChangeMeshModel();
                yield return new WaitForSeconds(1f);
                {

                    effect.gameObject.SetActive(false);
                }

            }
           
        }
    }
    public void ResetModel()
    {
        skin.gameObject.SetActive(true);
        skinNormal.gameObject.SetActive(false);
         modelFilter.mesh = modelOLd;
    }    
    public void ActiveEffectAI()
    {
        effect.gameObject.SetActive(true);
    }
    private void OnDisable()
    {
        StopAllCoroutines();
    }
}
