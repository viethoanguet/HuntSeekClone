using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using DG.Tweening;
public class PlayerController : MonoBehaviour
{
    public PlayerAnimator anim;
    public bool checkBoss;
    public bool isDead;
  
    private void Start()
    {
        checkBoss = false;
        isDead = false;

    }
    private void OnTriggerEnter(Collider other)
    {
        if(other.CompareTag("Arrow"))
        {
            gameObject.transform.DOScale(new Vector3(0.8f, 0.8f, 0.8f), 1f);
            checkBoss = true;
            UIManager.ins.ActiveBannerDelay321();
        }    
    }

    private void OnCollisionEnter(Collision collision)
    {
        if (collision.gameObject.CompareTag("AIPlayer"))
        {

               anim.SetAnimAttack();
  

        }

    }
}
