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

    public ChangeMesh changMesh;
    void Start()
    {
        isDealAI = false;
        checkAIBoss = false;
        check = false;
       // StartCoroutine(WaitMove());
    }

    public void MoveRandom()
    {
        posRandom = AIandPosController.instance.randomPos();
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
            GameManager.instance.countAI--;
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
                GameManager.instance.countAI--;
                GameManager.instance.OnWin();
            }

        }

    }
}
