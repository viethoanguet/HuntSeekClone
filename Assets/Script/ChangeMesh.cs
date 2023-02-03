using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ChangeMesh : MonoBehaviour
{
    [SerializeField] private MeshFilter modelFilter;
    [SerializeField] private Mesh[] modelChange;
    [SerializeField] private int current;
    private void Start()
    {
        StartCoroutine(Changemesh());
    }
    public void ChangeMeshModel()
    {
        modelFilter.mesh = modelChange[current];
    }
    IEnumerator Changemesh()
    {
        yield return new WaitForSeconds(3f);
        {
            ChangeMeshModel();
        }
    }
}
