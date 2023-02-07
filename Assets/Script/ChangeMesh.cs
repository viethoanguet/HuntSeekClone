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
    private void Start()
    {
        modelOLd = modelFilter.mesh;
        effect.gameObject.SetActive(false);
        StartCoroutine(Changemesh());
    }
    public void ChangeMeshModel()
    {
        //effect.gameObject.SetActive(true);
        modelFilter.mesh = modelChange[current];
       // EffectManager.Instance.SpawnWhiteEffect(transform.position, transform);
       
    }
    IEnumerator Changemesh()
    {
        yield return new WaitForSeconds(3f);
        {
            effect.gameObject.SetActive(true);
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
      
        modelFilter.mesh = modelOLd;
    }    
    public void ActiveEffectAI()
    {
        effect.gameObject.SetActive(true);
    }    
}
