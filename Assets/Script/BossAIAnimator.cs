using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BossAIAnimator : MonoBehaviour
{
    public Animator anim;
    private void Start()
    {
        anim = gameObject.GetComponent<Animator>();
    }

    public void SetAnimAttack(bool attack)
    {

        anim.SetBool("attack", attack);
    }
    public void SetAnimDamage()
    {

        anim.SetTrigger("damage");
    }
    public void SetAnimRun()
    {

        anim.SetTrigger("run");
    }
}
