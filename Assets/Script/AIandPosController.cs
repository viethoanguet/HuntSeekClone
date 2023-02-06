using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using DG.Tweening;
public class AIandPosController : MonoBehaviour
{
    [SerializeField] private List<Transform> posAI;
    [SerializeField] private List<AIPlayer> listAI;
    public static AIandPosController instance;
    private int n;
    private void Awake()
    {
        if (instance == null)
        {
            instance = this;
        }

    }

    private void Start()
    {
        StartCoroutine(WaitMove());
    }
    private IEnumerator WaitMove()
    {
        yield return new WaitForSeconds(3f);
        RandomPosAI();
    }
    public void RandomPosAI()
    {
        for(int i=0;i<listAI.Count;i++)
        {
            listAI[i].MoveRandom();
            posAI.RemoveAt(n);
        }    
    }

    public Vector3 randomPos()
    {
         n = Random.Range(0, posAI.Count);
        return posAI[n].position;
    }    


}
