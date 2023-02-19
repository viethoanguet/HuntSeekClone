using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using DG.Tweening;
public class PlayerController : MonoBehaviour
{
    public PlayerAnimator anim;
    public bool checkBoss;
    public bool isDead;
    public GameObject effect;
    private void Start()
    {
        checkBoss = false;
        isDead = false;
        effect.gameObject.SetActive(false);
    }
    private void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("Arrow"))
        {
            effect.gameObject.SetActive(true);
            effect.transform.DOScale(new Vector3(2, 2, 2), 0.1f);
            gameObject.transform.DOScale(new Vector3(1, 1, 1), 1f);
            checkBoss = true;
            UIManager.ins.SetChecktime();
            UIManager.ins.ActiveBannerDelay321();
        }
    }

    private void OnCollisionEnter(Collision collision)
    {
        if (collision.gameObject.CompareTag("AIPlayer"))
        {
            if(checkBoss)
            {
                anim.SetAnimAttack();
            }    

        }
        if (collision.gameObject.CompareTag("TableJump"))
        {
            transform.DOJump(gameObject.transform.position + new Vector3(0f, 0.5f, 0.5f), 0.4f, 1, 0.5f);
        }

    }
    public void ActiveEffect()
    {
        effect.gameObject.SetActive(true);
    }
    private void OnDisable()
    {
        transform.DOKill();
    }
}
