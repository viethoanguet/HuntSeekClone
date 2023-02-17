using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using DG.Tweening;
using UnityEngine.AI;
public class AIPlayer : MonoBehaviour
{
    public NavMeshAgent agent;
    public bool check;
    private Vector3 posRandom;
    public Transform archor;
    public bool isDealAI;
    public GameManager gameManager;
    public ChangeMesh changMesh;
    public AIManager aiMng;
    public AIPlayerAnimation anim;

    void Start()
    {

    }
    private void OnEnable()
    {
        isDealAI = false;
        check = false;
    }
    public void MoveRandom()
    {
        posRandom = aiMng.aIandPosController.randomPos();
        gameObject.transform.forward = Direction(posRandom);
        if (!check)
        {
            transform.DOMove(posRandom, SetTime(posRandom)).SetEase(Ease.Linear);
        }
    }
    public Vector3 RandomNavmeshLocation(float radius)
    {
        Vector3 randomDirection = Random.insideUnitSphere * radius;
        randomDirection += transform.position;
        NavMeshHit nav;
        Vector3 finalPosition = Vector3.zero;
        if (NavMesh.SamplePosition(randomDirection, out nav, radius, 1))
        {
            finalPosition = nav.position;
        }
        return finalPosition;
    }
    public void ModeNavMesh()
    {
        agent.SetDestination(RandomNavmeshLocation(2f));
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

    private void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("Arrow"))
        {
            gameObject.transform.DOScale(new Vector3(2, 2, 2), 1f);
            // UIManager.ins.checkTime = false;
            gameManager.countAI--;
            StartCoroutine(WaitActiveFalse());
        }
    }
    private void OnCollisionEnter(Collision collision)
    {
        if (collision.gameObject.CompareTag("BossAI"))
        {
            StartCoroutine(WaitTimeCheckCollision());
            transform.DOKill();
        }
        if (collision.gameObject.CompareTag("Player"))
        {
            if (UIManager.ins.checkTime)
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
            EffectManager.Instance.SpawnWhiteEffect(transform.position + new Vector3(0f, 1f, 0f), transform);
            yield return new WaitForSeconds(0.2f);
            {
                anim.SetAnimDie();
                yield return new WaitForSeconds(1.5f);
                {
                    gameObject.SetActive(false);
                    gameObject.transform.DOKill();
                    gameManager.countAI--;
                    gameManager.OnWin();
                }
            }
        }
    }
    private void OnDisable()
    {
        StopAllCoroutines();
    }
}
