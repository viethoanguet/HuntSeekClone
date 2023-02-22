using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using DG.Tweening;
public class ChangeMeshPlayer : MonoBehaviour
{
    [SerializeField] private MeshFilter modelFilter;
    [SerializeField] private SkinnedMeshRenderer modelMesh;
    [SerializeField] private Mesh[] modelChange;
    [SerializeField] private int current;
    [SerializeField] private PlayerController player;
    public Material roomtexure;
    public GameObject ModelPlayer;
    public ModelControllerSkin skin;

    private void OnEnable()
    {
        modelFilter.gameObject.SetActive(false);
        modelMesh.gameObject.SetActive(false);

        // ModelPlayer.gameObject.SetActive(true);
    }
    private void Start()
    {
        current = Random.Range(1, modelChange.Length);
        StartCoroutine(Changemesh());
    }
    public void UpdateSkin()
    {
        skin.SetSkin();
    }
    public void ChangeMeshModel()
    {

        modelFilter.gameObject.SetActive(true);
        modelMesh.gameObject.SetActive(true);
        ModelPlayer.gameObject.SetActive(false);

        if (!player.checkBoss)
        {
            modelFilter.mesh = modelChange[current];
            modelMesh.gameObject.SetActive(false);
            modelFilter.GetComponent<Renderer>().material = roomtexure;
        }

    }
    IEnumerator Changemesh()
    {
        yield return new WaitForSeconds(3f);
        {
            player.ActiveEffect();
            //  gameObject.transform.DOScale(new Vector3(1, 1, 1), 0.2f);
            yield return new WaitForSeconds(0.2f);
            {
                ChangeMeshModel();
            }
        }
    }
    private void OnDisable()
    {
        StopAllCoroutines();
    }

}
