using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AIPlayerAnimation : MonoBehaviour
{
    public Animator anim;

    private void Start()
    {

    }

    public void SetAnimDie()
    {

        anim.SetTrigger("die");
    }
   
}
