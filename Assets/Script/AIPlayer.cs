using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using DG.Tweening;
public class AIPlayer : MonoBehaviour
{
    [SerializeField] bool checkAIBoss;
    public bool check;
    private Vector3 posRandom;
    public Transform archor;
    public bool isDealAI;
    public GameManager gameManager;
    public ChangeMesh changMesh;
    public AIManager aiMng;
    void Start()
    {
      
       // StartCoroutine(WaitMove());
    }
    private void OnEnable()
    {
        isDealAI = false;
        checkAIBoss = false;
        check = false;
    }
    public void MoveRandom()
    {

        posRandom = aiMng.aIandPosController.randomPos();
       // posRandom = new Vector3(archor.position.x + Random.Range(-3, 3), 0, archor.position.z + Random.Range(-3, 3));
        gameObject.transform.forward = Direction(posRandom);
        if (!check)
        {
            transform.DOMove(posRandom, SetTime(posRandom)).SetEase(Ease.Linear);
        }
    }

    private Vector3 Direction(Vector3 pos)
    {
        Vector3 direction = pos - gameObject.transform.position;
        //direction.SetY(0f);
        direction.Normalize();
        return direction;
    }
    private float SetTime(Vector3 pos)
    {
        float distance = Vector3.Distance(pos, gameObject.transform.position);
        return distance / 1;
    }


    private IEnumerator WaitMove()
    {
        yield return new WaitForSeconds(3f);
         MoveRandom();
    }
    private void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("Arrow"))
        {
            checkAIBoss = true;
           // EffectManager.Instance.SpawnWhiteEffect(transform.position, null);
            gameObject.transform.DOScale(new Vector3(1, 1, 1), 1f);
           // UIManager.ins.checkTime = false;
            gameManager.countAI--;
            StartCoroutine(WaitActiveFalse());

        }
    }
    private void OnCollisionEnter(Collision collision)
    {
        if(collision.gameObject.CompareTag("BossAI"))
        {
            StartCoroutine(WaitTimeCheckCollision());
        }
        if(collision.gameObject.CompareTag("Player"))
        {
           //  StartCoroutine(WaitTimeCheckCollision());
           if(UIManager.ins.checkTime)
            {
                StartCoroutine(WaitTimeCheckCollision());
            }    
           
        }
    }
    private IEnumerator WaitActiveFalse()
    {
        yield return new WaitForSeconds(1f);
        gameObject.SetActive(false);
    }

    private IEnumerator WaitTimeCheckCollision()
    {
        
        yield return new WaitForSeconds(1f);
        {
            changMesh.ActiveEffectAI();
            changMesh.ResetModel();
            yield return new WaitForSeconds(0.5f);
            {            
                gameObject.SetActive(false);
                gameObject.transform.DOKill();
                gameManager.countAI--;
                gameManager.OnWin();
            }

        }

    }
    private void OnDisable()
    {
        StopAllCoroutines();
    }
}
