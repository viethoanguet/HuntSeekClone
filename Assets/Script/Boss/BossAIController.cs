using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using DG.Tweening;
using UnityEngine.AI;
public class BossAIController : MonoBehaviour
{

    public NavMeshAgent agent;
    public bool check;
    private Vector3 posRandom;
    private int posN;
    public Transform archor;
    public BossAIAnimator animBoss;
    [SerializeField] private List<Transform> posAI;
    public GameObject effectboss;
    public AudioClip bossMove;
    public bool checkAttack;
    private void Start()
    {
        agent = GetComponent<NavMeshAgent>();
        check = false;
        effectboss.gameObject.SetActive(false);
        checkAttack = false;
    }
    private void OnEnable()
    {
        gameObject.transform.DOKill();
    }
    private void Update()
    {
        if (Vector3.Distance(gameObject.transform.position, posRandom) < 0.2f)
        {
            if (checkAttack)
            {
                StartCoroutine(WaitAttack());
                checkAttack = false;
            }
        }
    }
    public void MoveRandom()
    {
        if (!check)
        {
            if (posAI.Count < 1) { return; }
            posN = Random.Range(0, posAI.Count);
            posRandom = posAI[posN].position;
            gameObject.transform.forward = Direction(posRandom);
            agent.SetDestination(posRandom);
            checkAttack = true;
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
    IEnumerator WaitAttack()
    {
        animBoss.SetAnimDamage();
        posAI.RemoveAt(posN);
        yield return new WaitForSeconds(2f);
        {
            //animBoss.SetAnimRun();
            MoveRandom();
        }
    }
    private void OnCollisionEnter(Collision collision)
    {
        if (collision.gameObject.CompareTag("Player"))
        {
            animBoss.SetAnimDamage();
            StartCoroutine(WaitAttackPlayer());
            transform.DOKill();
        }
        if (collision.gameObject.CompareTag("Item"))
        {
            animBoss.SetAnimDamage();
            Debug.Log("item");
            // StartCoroutine(WaitAttack());
        }
        if (collision.gameObject.CompareTag("AIPlayer"))
        {
            //animBoss.SetAnimDamage();
            // StartCoroutine(WaitAttack());
        }
    }

    public void ActiveEffectBoss()
    {
        effectboss.gameObject.SetActive(true);
        MoveRandom();
    }
    IEnumerator WaitAttackPlayer()
    {
        yield return new WaitForSeconds(1f);
        {
            GameManager.instance.OnLose();
        }
    }
    private void OnDisable()
    {
        gameObject.SetActive(false);
        StopAllCoroutines();
    }
}
