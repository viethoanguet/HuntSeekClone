using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ChangeMeshPlayer : MonoBehaviour
{
    [SerializeField] private MeshFilter modelFilter;
    [SerializeField] private SkinnedMeshRenderer modelMesh;
    [SerializeField] private Mesh[] modelChange;
    [SerializeField] private int current;
    [SerializeField] private PlayerController player;
    private void Start()
    {
        current = Random.Range(1, modelChange.Length);
        StartCoroutine(Changemesh());
    }
    public void ChangeMeshModel()
    {
        if(!player.checkBoss)
        {
            modelFilter.mesh = modelChange[current];
            modelMesh.gameObject.SetActive(false);
        }    

    }
    IEnumerator Changemesh()
    {
        yield return new WaitForSeconds(3f);
        {
            ChangeMeshModel();
        }
    }
}
