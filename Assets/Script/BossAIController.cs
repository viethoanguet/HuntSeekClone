using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using DG.Tweening;
public class BossAIController : MonoBehaviour
{
    public bool check;
    private Vector3 posRandom;
    public Transform archor;
    public BossAIAnimator animBoss;
    private void Start()
    {
        check = false;
        MoveRandom();
    }
    public void MoveRandom()
    {

        posRandom = new Vector3(archor.position.x + Random.Range(-5, 5), 0, archor.position.z + Random.Range(-5, 5));
        
        gameObject.transform.forward = Direction(posRandom);
        
        if (!check)
        {
            transform.DOMove(posRandom, SetTime(posRandom)).SetEase(Ease.Linear).OnComplete(() =>
            {
                animBoss.SetAnimDamage();

                //MoveRandom();

                  StartCoroutine(WaitAttack());
            });
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
        return distance /1;
    }
    IEnumerator WaitAttack()
    {
       
        yield return new WaitForSeconds(1.5f);
        {
            //animBoss.SetAnimRun();
            MoveRandom();
            
        }
    }
    private void OnCollisionEnter(Collision collision)
    {
        if(collision.gameObject.CompareTag("Player") )
        {
            GameManager.instance.OnLose();
        }    
       
    }

}
