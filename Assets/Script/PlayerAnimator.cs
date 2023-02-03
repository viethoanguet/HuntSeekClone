using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerAnimator : MonoBehaviour
{
    public Animator anim;

   // public const string run = "run";
   


    private void Start()
    {
        anim = gameObject.GetComponent<Animator>();
    }
    public void SetAnimRun(bool run)
    {

        anim.SetBool("run", run);
    }
    public void SetAnimDeath(bool death)
    {

        anim.SetBool("death", death);
    }
    public void SetAnimAttack()
    {

        anim.SetTrigger("attack");
    }
}
